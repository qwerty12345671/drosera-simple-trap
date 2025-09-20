# Drosera Workshop-3 (Deploy Trap Discordname Onchain) 
CLI operation without docker or systemd

# Minimum System Requirement 
- 2 CPU Cores
- 4 GB RAM
- 20 GB Disk Space
- Bandwitch 100mbps
- Ethereum Hoodi Faucet min 0.2 ETH in your wallets
- Ethereum Hoodi RPC

# JUST FOLLOW THE COMMAND 1-14 AND COPY PASTE THANK YOU

In this workshop we will:

- Update our `Trap.sol` file to respond with our discord name.
- Update our `example.env` copy to `.env` to get access your data

## Setup
1. Login to your terminal (windows power shell)
**Note : Skip this step if using Termius or Mobaxterm**
```bash
ssh username@YOURIPVPS
```
Example : ( ssh root@132.444.23.12 )

2. Setup Your VPS Package 
```bash
sudo apt-get update && sudo apt-get upgrade -y
```
```bash
sudo apt install curl screen iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev ca-certificates  -y
```
Warning this is important you need allow your port first before enable your firewall
```bash
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 31313/tcp
sudo ufw allow 31314/tcp
sudo ufw allow 31315/tcp
sudo ufw allow 31316/tcp
```
Now enable your firewall
```bash
sudo ufw enable
```
Done 

3. Install Drosera CLI
```bash
curl -L https://app.drosera.io/install | bash
```
```bash
source /root/.bashrc
```
```bash
droseraup
```
4. Install Foundry
```bash
curl -L https://foundry.paradigm.xyz | bash
```
```bash
source /root/.bashrc
```
```bash
foundryup
```
5. Install Bun
```bash
curl -fsSL https://bun.sh/install | bash
```
```bash
source /root/.bashrc
```
6. Clone Our Repository
```bash
git clone https://github.com/Warx04/drosera-workshop-3.git
```
```bash
cd drosera-workshop-3
```
```bash
bun install
```
7. Edit your Trap.sol fill with your Discord NickName ( Not Username )
```bash
nano src/Trap.sol
```
<img width="684" height="110" alt="image" src="https://github.com/user-attachments/assets/7c5254f6-f11b-46ea-adbb-f5d24d46457c" />

and then ctrl x + y enter

8. **Note:** Make sure to build the contracts before running the Drosera commands so the updated bytecode is used.
```bash
forge build
```
<img width="706" height="231" alt="image" src="https://github.com/user-attachments/assets/39c6b7c0-ebc2-4657-8c93-4e480b7b809b" />

forget about note

9. Setting your drosera.toml
```bash
nano drosera.toml
```
fill 

whitelist = ["yourevmaddress1"] // 1 operator ,

whitelist = ["yourevmaddress1","yourevmaddress2"] // 2 operator

with your EVM address ( 1 EVM address if 1 operator , 2 EVM address if 2 operator )

see the picture 

<img width="517" height="307" alt="image" src="https://github.com/user-attachments/assets/59597481-3e57-4498-ba5c-cbb99e0de3cb" />

and save ctrl x + y enter

```bash
drosera dryrun
```
```bash
DROSERA_PRIVATE_KEY=xxxxx drosera apply
```
change xxxxx with **YOUR EVM PRIVATE KEY** and then enter
you got TRAP_ADDRESS 

10. Setup The Operator 
```bash
cp example.env .env
```
```bash
nano .env
```
fill your DROSERA_PRIVATE_KEY, VPS_IP, TRAP_ADDRESS
see the picture for result after change

<img width="698" height="129" alt="image" src="https://github.com/user-attachments/assets/59b47cc7-e3e8-4557-88c1-af4e0ed9c6ef" />

and then ctrl x + y

11. Register Your Operator
```bash
make register-operator
```
notif successfully

12. Opt in your Operator
```bash
make optin
```
notif successfully

13. Bloombost Your Trap
```bash
make bloombost
```

14. Running Your Drosera Node CLI
```bash
screen -S drosera
```
```bash
make run-operator
```
Wait The Logs 
if you want close the screen ctrl a + d

**DONE YOURE SUCCESSFULLY RUNNING DROSERA NODE FOR 1 OPERATOR**

15 .After the trap is deployed and shouldRespond is true, we can check if the user has responded by calling the isResponder function on the response contract and pass in the trapConfig owners address.
```bash
cast call 0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608 "isResponder(address)(bool)" <yourevmaddress> --rpc-url https://ethereum-hoodi-rpc.publicnode.com
```

16. Check your discordname onchain list
```bash
cast call 0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608 "getDiscordNamesBatch(uint256,uint256)(string[])" 0 50000 --rpc-url https://ethereum-hoodi-rpc.publicnode.com | grep -E "yourdiscordname"
```
# Additional Command
a. Check your logs with screen 
```bash
screen -r drosera
```

b. Kill your screen 
```bash
screen -S drosera -X kill
```
```bash
screen -S drosera2 -X kill
```

c. Register 2nd Operator
```bash
make register-operator2
```

d. Optin 2nd Operator
```bash
make optin2
```
e. Run 2nd Operator
```bash
screen -S drosera2
```
```bash
make run-operator2
```
and then ctrl a + d to exit screen.

