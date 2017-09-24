#!/bin/bash

socket=$HOME/.ssh/spinnaker-tunnel.ctl

if [ ! \( -e ${socket} \) ]; then
    echo "Opening tunnel to Spinnaker..."
    ssh -f -N spinnaker-start && echo "Tunnel open."
else
    echo "Closing tunnel to Spinnaker..."
    ssh -O "exit" spinnaker-stop && echo "Tunnel closed."
fi
