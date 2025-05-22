# Drosera Workshops

## Setup

```bash
bun install
```

## Notes

- For each workshop, you may need to update the trap path in the `drosera.toml` file to point to current workshop build files.
- You will need to add the operator address to the `whitelist` in the `drosera.toml` file to opt in to the trap.

## Build Commands

After making changes to the contracts, you will need to build the contracts before running the Drosera commands so the updated bytecode is used.

```bash
make build-workshop-1
```

```bash
make build-workshop-2
```

```bash
make build-workshop-3
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
