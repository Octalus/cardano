#!/bin/bash
echo "Startup Cardano Nodes"
echo "======================"

cd /home/ec2-user/testnet-haskell

echo "- Start Relay in Screen"
screen -d -S "r" -m ./start-relay.sh

echo "- Start Block Producer in Screen"
screen -d -S "b" -m ./start-block-producing.sh

echo "- Start Watch-dog"
screen -d -S "s" -m ./stuck_monitor.sh

