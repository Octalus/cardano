#!/bin/bash

cd block-producing
cardano-node run --topology shelley_testnet-topology.json \
                 --database-path db \
                 --socket-path db/node.socket \
		         --host-addr 127.0.0.1 \
		         --port 3001 \
		         --config shelley_testnet-config.json \
		         --shelley-kes-key ../keys/node/kes.skey \
     		     --shelley-vrf-key ../keys/node/vrf.skey \
     		     --shelley-operational-certificate ../keys/node/node.cert
