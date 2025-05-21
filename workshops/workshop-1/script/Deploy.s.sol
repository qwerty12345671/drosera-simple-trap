// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MockResponse} from "./mock/MockResponse.sol";

contract DeployScript is Script {
    uint256 deployerPrivateKey;
    address constant DROSERA = 0xea08f7d533C2b9A62F40D5326214f39a8E3A32F8;

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
