#!/bin/bash

cd relay
cardano-node run --topology shelley_testnet-topology.json \
                 --database-path db \
                 --socket-path db/node.socket \
		         --host-addr 127.0.0.1 \
		         --port 3002 \
		         --config shelley_testnet-config.json
