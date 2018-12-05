package main

import (
	"encoding/json"
	"github.com/streadway/amqp"
	"io/ioutil"
	"log"
	"os"
)

type DocumentFile struct {
	ID       string
	Filename string
	Bytes    []byte
	Size     int64
	Type     string
}

type ConfirmationQueue struct {
	Type    string
	Message string
	Event string

}

func receiverFileMessage() {
	conn, err := amqp.Dial(rabbitServer)
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()
	log.Printf("iniciando:")
	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	q, err := ch.QueueDeclare(
		storageRequestQueue, // name
		true,                // durable
		false,               // delete when unused
		false,               // exclusive
		false,               // no-wait
		nil,                 // arguments
	)
	failOnError(err, "Failed to declare a queue")

	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		false,  // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	failOnError(err, "Failed to register a consumer")

	go func() {
		for d := range msgs {
			//log.Printf("Received a message %s",d.Body)
			var documentNormal DocumentFile
			errDecoding := json.Unmarshal(d.Body, &documentNormal)
			if errDecoding != nil {
				panic(errDecoding)
			}

			if documentNormal.Type == "create" {
				err := ioutil.WriteFile("./files/"+documentNormal.Filename, documentNormal.Bytes, 777)

				if err != nil {
					log.Println("ERROR : Save file")
					documentJSON, _ := json.Marshal(ConfirmationQueue{Type: "error", Message: " Error" + documentNormal.Filename})
					go sendFileMessage(documentJSON)
				}
				log.Println("INFO : Created successfully " + documentNormal.Filename)

				documentJSON, err := json.Marshal(ConfirmationQueue{Type: "successfully", Message: " Created successfully " + documentNormal.Filename,Event:"created"})
				go sendFileMessage(documentJSON)
			} else {
				if documentNormal.Type == "delete" {
					err := os.Remove("./files/" + documentNormal.Filename)
					if err != nil {
						log.Println("ERROR : Delete file")
						documentJSON, _ := json.Marshal(ConfirmationQueue{Type: "error", Message: " Error Delete file" + documentNormal.Filename})
						go sendFileMessage(documentJSON)
					} else {
						log.Println("INFO : Deleted successfully " + documentNormal.Filename)

						documentJSON, _ := json.Marshal(ConfirmationQueue{Type: "successfully", Message: " Delete successfully " + documentNormal.Filename,Event:"deleted"})
						go sendFileMessage(documentJSON)
					}
				}
			}

			d.Ack(false)
		}
	}()

	log.Printf(" [*] Waiting for messages. To exit press CTRL+C")
	forever := make(chan bool)
	<-forever
}
