#!/bin/bash

if [ -e /data/db/mongod.lock ]; then
    echo "Mongod lock file found. Checking if Mongod is running..."

    if ! pgrep -n mongod; then
        echo "Mongod is not running. Attempting repair..."
        sudo mongod --dbpath /data/db --repair

        if [ $? -eq 0 ]; then
            echo "Repair Succeeded."
        else
            echo "Repair Unsucessful. Needs manual repair."
            sudo mv /data/db "/data/db-needs-repair-$(date +%s)"
        fi
    else
        echo "Mongod is running. No further action needed."
    fi
else
    echo "Mongod lock file not found. No action needed."
fi

set -e
echo "Starting Mongod..."
mongod