# dss-Storage
Component made with Go, receives a file 
## Getting Started

Just follow the instruction to copy and run the project.

### Prerequisites

* Install Go from its page at https://golang.org/.

### Installing

* Clone the project to your src Golang project folder, on windows its on C:\Users\go\src. 
* In the folder open a terminal an write the following:
```
go get -u github.com/golang/dep/cmd/dep
```
```
dep init -v
```
```
dep ensure -v 
```
* Execute the http server:
```
go run main.go receiver.go sender.go
```

### Output

* the Program send ACK .


## Built With

* [Go](https://golang.org/) - The Programming langauge
* [Rabbitmq](https://www.rabbitmq.com/) - Queue Messages

## Authors

* **Alejandro Cabrera** - [alep007](https://github.com/alep007)
* **Josue Ferrufino** - [josue1471515](https://github.com/orgs/Kuma-gg/people/josue1471515)

### To Do
* Test
