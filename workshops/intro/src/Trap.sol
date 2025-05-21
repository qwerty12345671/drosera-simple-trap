// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "drosera-contracts/interfaces/ITrap.sol";

contract Trap is ITrap {
    address RESPONSE_CONTRACT;

    function collect() external view returns (bytes memory) {
        return bytes("");
    }

    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory) {
        return (true, bytes(""));
    }
}
