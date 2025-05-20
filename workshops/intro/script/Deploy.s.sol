// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";

contract DeployScript is Script {
    function run() public {
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
