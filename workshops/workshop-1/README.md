# Drosera Workshop-1

In this workshop we will:

- Run basic commands to deploy a trap.

## Commands

**Note:** Make sure to build the contracts before running the Drosera commands so the updated bytecode is used.

```bash
forge build
```

Test the trap before applying it to the network.

```bash
drosera dryrun
```

Apply the trap to the network.

```bash
drosera apply
```

After the trap is deployed and shouldRespond is true, we can check if the user has responded by calling the isResponder function on the response contract and pass in the trapConfig owners address.

```bash
cast call 0x62dD18Ee3e0bDAB538d4DA6F79aAde7269d3E97f "isResponder(address)" <owner_address> --rpc-url https://0xrpc.io/hoodi
```

## Operator Commands

```bash
make register-operator
```

```bash
make optin
```

```bash
make run-operator
```
