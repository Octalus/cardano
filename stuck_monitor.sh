#!/bin/bash
#
# Created by Uruncle @ https://adage.app Cardano Stake Pool
#
# Disclaimer:
#
#  The following use of shell script is for demonstration and understanding
#  only, it should *NOT* be used at scale or for any sort of serious
#  deployment, and is solely used for learning how the node and blockchain
#  works, and how to interact with everything.
#
### CONFIGURATION
export PATH=$PATH:/home/hammer/Cardano/jormungandr-v0.8
LAST_BLOCK=""
RESTART_GT=600

START_TIME=$SECONDS

while true
do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    echo ""
    echo "${TIME} - Press [CTRL+C] to stop..."
    LATEST_BLOCK=$(curl http://127.0.0.1:12789/metrics 2>/dev/null | grep -i cardano_node_ChainDB_metrics_blockNum_int | awk '{print $2}')

    if [ "$LATEST_BLOCK" > 0 ]; then
        if [ "$LATEST_BLOCK" != "$LAST_BLOCK" ]; then
            START_TIME=$(($SECONDS))
            echo "New block height: ${LATEST_BLOCK}"
            LAST_BLOCK="$LATEST_BLOCK"
        else
            ELAPSED_TIME=$(($SECONDS - $START_TIME))
            echo "Current block height: ${LATEST_BLOCK} - No new block for ${ELAPSED_TIME} sec."
            if [ "$ELAPSED_TIME" -gt "$RESTART_GT" ]; then
                restart-nodes.sh
		LAST_BLOCK="$LATEST_BLOCK"
                echo "Sleeping for 60 sec."
                sleep 60
            fi
        fi
    else
        echo "No block height"
    fi
    sleep 60
done

exit 0
