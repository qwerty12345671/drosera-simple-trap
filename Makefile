-include .env

# Operator commands

# register the operator within the network if not already registered
register-operator:
	drosera-operator register \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--drosera-address ${DROSERA_ADDRESS}

register-operator2:
	drosera-operator register \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY2} \
	--drosera-address ${DROSERA_ADDRESS}

run-operator:
	drosera-operator node \
	--network-p2p-port 31313 \
	--server-port 31314 \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--network-external-p2p-address ${VPS_IP} \
	--drosera-address ${DROSERA_ADDRESS} \
	--log-level info \
	--listen-address 0.0.0.0 \
	--db-file-path ./data/operator.db \
	--disable-dnr-confirmation true

run-operator2:
    drosera-operator node \
    --network-p2p-port 31315 \
    --server-port 31316 \
    --eth-rpc-url ${RPC_URL} \
    --eth-private-key ${DROSERA_PRIVATE_KEY2} \
    --network-external-p2p-address ${VPS_IP} \
    --drosera-address ${DROSERA_ADDRESS} \
    --log-level info \
    --listen-address 0.0.0.0 \
    --db-file-path ./data/operator.db \
    --disable-dnr-confirmation true

# replace the trap config address with the one you want to optin to
optin:
	drosera-operator optin \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--drosera-address ${DROSERA_ADDRESS} \
	--trap-config-address ${TRAP_ADDRESS}

optin2:
    drosera-operator optin \
    --eth-rpc-url ${RPC_URL} \
    --eth-private-key ${DROSERA_PRIVATE_KEY2} \
    --drosera-address ${DROSERA_ADDRESS} \
    --trap-config-address ${TRAP_ADDRESS}

# replace the trap config address with the one you want to optout from
optout:
	drosera-operator optout \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--drosera-address ${DROSERA_ADDRESS} \
	--trap-config-address ${TRAP_ADDRESS}

optout2:
	drosera-operator optout \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY2} \
	--drosera-address ${DROSERA_ADDRESS} \
	--trap-config-address ${TRAP_ADDRESS}

# bloombost your trap via cli
bloombost:
	drosera bloomboost \
	--trap-address ${TRAP_ADDRESS} \
	--eth-amount 0.1

