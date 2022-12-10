#!/bin/bash

function startMongoInstance(){
    echo "Launching Mongo..."
    # Run Mongo in a separate shell instance
    # On Arch Linux, Mongo logs will then be grepable from `journalctl`
    # E.g. `journalctl | grep mongo`
    mongod --fork --syslog
    sleep 1
    echo "Launching MongoDB Compass..."
    mongodb-compass
}

# Return ports that local Mongo instance is using
LIST_MONGO_PORTS="$(pgrep -f mongod)"

# No ports active? Start Mongo instance
if [ -z $LIST_MONGO_PORTS ]; then
    startMongoInstance
    
    # Active ports? Kill them and start Mongo instance
else
    echo "Terminating existing Mongo instance..."
    sleep 2
    echo $LIST_MONGO_PORTS | while read -r pid ; do
        sudo kill $pid
    done
    startMongoInstance
fi
