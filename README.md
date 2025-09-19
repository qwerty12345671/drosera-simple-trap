# Drosera Workshop-3

In this workshop we will:

- Update our `drosera.toml` file to use the new `respondWithDiscordName(string)` function signature and new response contract address.
- Update our `Trap.sol` file to respond with our discord name.

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
cast call 0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608 "isResponder(address)(bool)" <owner_address> --rpc-url https://0xrpc.io/hoodi
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
