// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MockResponse} from "./mock/MockResponse.sol";

contract DeployScript is Script {
    uint256 deployerPrivateKey;
    address constant DROSERA = 0x91cB447BaFc6e0EA0F4Fe056F5a9b1F14bb06e5D;

    function run() public {
        if (block.chainid == 31337) {
            deployerPrivateKey = vm.envUint("ANVIL_PRIVATE_KEY");
        } else {
            deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        }
        vm.startBroadcast(deployerPrivateKey);

        MockResponse mockResponse = new MockResponse(DROSERA);
        console.log("MockResponse deployed at", address(mockResponse));

        vm.stopBroadcast();
    }
}
