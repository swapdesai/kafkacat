# file: Makefile
DOCKER_BUILD_KAFKACAT=docker-compose build
DOCKER_RUN_KAFKACAT=\
	docker run -it \
	--mount type=bind,source=${PWD}/consumer.properties,target=/consumer.properties,readonly \
	--mount type=bind,source=${KEY_FILE},target=/service.key,readonly \
	--mount type=bind,source=${CERT_FILE},target=/service.crt,readonly \
	--mount type=bind,source=${CA_FILE},target=/ca.crt,readonly \
	-e BOOTSTRAP_SERVER=${BOOTSTRAP_SERVER} \
	-e TOPIC_NAME=${TOPIC_NAME} \
	kafkacat
	# kafkacat sh

# CONSUMER_PROPERTIES is consumer.properties.template by default but can be overwritten
CONSUMER_PROPERTIES ?= consumer.properties.template

all: build vars run

###############
## Variables ##
###############
vars: consumerProperties
.PHONY: vars


###########
## Build ##
###########
build: 
	$(DOCKER_BUILD_KAFKACAT)
.PHONY: build

###########
## Build ##
###########
run: vars
	$(DOCKER_RUN_KAFKACAT)
.PHONY: run

###########
## Clean ##
###########
cleanDocker:
	docker-compose down --remove-orphans -v
.PHONY: cleanDocker

consumerProperties:
	echo "security.protocol=SSL" > consumer.properties.template
	echo "ssl.key.location=/service.key" >> consumer.properties.template
	echo "ssl.certificate.location=/service.crt" >> consumer.properties.template
	echo "ssl.ca.location=/ca.crt" >> consumer.properties.template
	echo "ssl.key.password=$(KEY_PASSWORD)" >> consumer.properties.template

	cp -f $(CONSUMER_PROPERTIES) consumer.properties
.PHONY: consumerProperties
