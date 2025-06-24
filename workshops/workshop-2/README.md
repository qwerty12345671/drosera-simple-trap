# Drosera Workshop-2

In this workshop we will:

- Update our `drosera.toml` file to use the new `someOtherResponseFunction()` function signature and new response contract address.

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
cast call 0x2eEaEFA08Bd3377d02a9ac75B9efF8Af5766313d "isResponder(address)(bool)" <owner_address> --rpc-url https://0xrpc.io/hoodi
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
