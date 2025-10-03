// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "drosera-contracts/interfaces/ITrap.sol";

contract SimpleTrap is ITrap {
    event TrapTriggered(address indexed sender, string message);

    function shouldRespond(bytes[] calldata data) external pure override returns (bool, bytes memory) {
        if (data.length > 0 && data[0].length > 0 && data[0][0] == 0x01) {
            return (true, abi.encode("valid trigger"));
        }
        return (false, "");
    }

    function collect() external pure override returns (bytes memory) {
        return abi.encode(true, "SimpleTrap responded!");
    }
}
