#!/bin/bash
set -e
if [ -e /data/db/mongod.lock ]; then
    echo "Mongod lock file found. Checking if Mongod is running..."

    if ! pgrep -n mongod; then
        echo "Mongod is not running. Attempting repair..."
        sudo -u mongodb mongod --dbpath /data/db --repair

        if [ $? -eq 0 ]; then
            echo "Repair Succeeded. Restarting Mongod..."
            sudo service mongodb start
            echo "Mongod Restarted."
        else
            echo "Repair Unsucessful. Needs manual repair."
            sudo mv /data/db/mongod.lock /data/db/mongod.lock.bad
        fi
    else
        echo "Mongod is running. No further action needed."
    fi
else
    echo "Mongod lock file not found. No action needed."
fi