#!/bin/bash
set -e

if [ "$1" == "sh" ]; then
    $@
else
    kafkacat \
        -F consumer.properties \
        -b $BOOTSTRAP_SERVER \
        -t $TOPIC_NAME \
        -L
    kafkacat \
        -F consumer.properties \
        -b $BOOTSTRAP_SERVER \
        -t $TOPIC_NAME \
        -C \
        -e -q \
        -o -1 \
        -f 'Partition: %p\tOffset: %o\n'
fi
