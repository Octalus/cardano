#!/bin/bash
echo "Restarting Cardano Nodes"
echo "======================"
echo "- Stop running nodes"
#kill $(ps -ed | grep screen | awk '{print $1}')
screen -X -S "r" quit
screen -X -S "b" quit
echo "- Sleeping for 2 sec."
sleep 2
cd /home/ec2-user/testnet-haskell
echo "- Start Relay in Screen"
screen -d -S "r" -m ./start-relay.sh
echo "- Start Block Producer in Screen"
screen -d -S "b" -m ./start-block-producing.sh
#screen -dm bash
#screen -r -X startRelay "cd relay && ./start-relay.sh^M"
