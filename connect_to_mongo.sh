#!/bin/bash

LIST_MONGO_PORTS="$(pgrep -f mongod)"

if [ -z $LIST_MONGO_PORTS ]; then
    echo "Launching Mongo..."
    sleep 2
    mongod
else
    echo "Terminating existing Mongo instance..."
    sleep 2
    echo $LIST_MONGO_PORTS | while read -r pid ; do
        sudo kill $pid
    done
    mongod
fi
