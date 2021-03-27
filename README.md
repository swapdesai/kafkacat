# kafkacat
## Introduction
kafkacat built using 3 musketeers pattern (https://3musketeers.io/)
 
 
## Pre requisites
The key, certificate & ca files (openSSL format) needs to be created with appropriate **READ** permissions to Kafka topic.

 
### Export the following env variables on your host machine to interact with kafka
```
export KEY_FILE=<key-file>
export CERT_FILE=<cert-file>
export CA_FILE=<ca-file>

export KEY_PASSWORD=<keystore-password>
 
export TOPIC_NAME=<topic-name>
 
export BOOTSTRAP_SERVER=<bootstrap-server>
 
```
 
## Make commands 
### Build the Docker container / app
```
make build
```
This step takes time to build the Docker image from apline base image, install java and kafka tools and configure the cli.
 
### Export the consumer properties file
```
make vars
```
 
### Run the Docker container / app
```
make run
```
