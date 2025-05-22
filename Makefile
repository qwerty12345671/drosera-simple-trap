-include .env

# forge build commands

build-workshop-1:
	cd workshops/workshop-1 && forge build

build-workshop-2:
	cd workshops/workshop-2 && forge build

build-workshop-3:
	cd workshops/workshop-3 && forge build

# Operator commands

# register the operator within the network if not already registered
register-operator:
	drosera-operator register \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--drosera-address ${DROSERA_ADDRESS}


run-operator:
	drosera-operator node \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--network-external-p2p-address localhost \
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
	--trap-config-address 0x0000000000000000000000000000000000000000

# replace the trap config address with the one you want to optout from
optout:
	drosera-operator optout \
	--eth-rpc-url ${RPC_URL} \
	--eth-private-key ${DROSERA_PRIVATE_KEY} \
	--drosera-address ${DROSERA_ADDRESS} \
	--trap-config-address 0x0000000000000000000000000000000000000000

