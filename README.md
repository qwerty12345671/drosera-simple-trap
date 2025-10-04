Drosera Simple Trap

Drosera Simple Trap is a minimal example of a smart contract that integrates with the Drosera decentralized automation framework.

It listens for specific trigger conditions and automatically responds on-chain, showcasing how developers can create and deploy lightweight, event-driven “traps” for blockchain automation.

⸻

⚙️ How It Works
	•	The contract implements the ITrap interface from Drosera.
	•	shouldRespond() checks if an incoming event matches a condition (e.g. data starts with 0x01).
	•	If true, it signals that a response should be made.
	•	collect() defines the actual automated response, returning a success message.

⸻

🧠 Example Response

cast call <trap_address> "collect()(bytes)" --rpc-url https://ethereum-hoodi-rpc.publicnode.com

Output:

SimpleTrap responded!


⸻

🪶 Configuration

The trap’s setup is defined in drosera.toml:

[traps.simpletrap]
response_contract = "0x8eb2f4909448951D7Eaa123fa8f15618764e73cD"
response_function = "collect()"
private_trap = true
whitelist = ["0x74fb4776f4261412f9438dd313d05340fa14da1d"]


⸻

📦 Repository Info
	•	RPC: https://ethereum-hoodi-rpc.publicnode.com
	•	Network: Drosera Hoodi Testnet
	•	Language: Solidity 0.8.20
	•	Framework: Drosera + Foundry

⸻

💡 About

This is a simple demonstration for educational and testing purposes, built as part of the Drosera Workshop #3.

