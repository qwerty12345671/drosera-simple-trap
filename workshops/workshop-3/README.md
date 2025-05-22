# Drosera Workshop-3

In this workshop we will:

- Update our `drosera.toml` file to use the new `respondWithDiscordName` function and new response contract address.
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
cast call 0x4608Afa7f277C8E0BE232232265850d1cDeB600E "isResponder(address)" <owner_address> --rpc-url https://ethereum-holesky-rpc.publicnode.com
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
