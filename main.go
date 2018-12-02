package main

//ContactDetails struct
type ContactDetails struct {
	Email   string
	Subject string
	Message string
}
var rabbitServer string
var storageRequestQueue string
var storageResposeQueue string

func main() {

	//RabbitMq server receiver
	rabbitServer = "amqp://guest:guest@localhost:5672/"
	storageRequestQueue = "storageRequestQueue"
	//

	//RabbitMq server receiver
	storageResposeQueue = "storageResponseQueue"

	//
	receiverFileMessage();
}
