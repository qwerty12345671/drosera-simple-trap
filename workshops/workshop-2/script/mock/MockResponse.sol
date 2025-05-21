// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ITrapConfig {
    function owner() external view returns (address);
}

interface IDrosera {
    function getRewardAddress(address _trap) external view returns (address);
}

contract MockResponse {
    bool active;
    address public drosera;
    mapping(address => bool) public responders;

    event Responded(address indexed user);

    constructor(address _drosera) {
        active = true;
        drosera = _drosera;
    }

    function isActive() external view returns (bool) {
        return active;
    }

    function someOtherResponseFunction() external {
        // reverts if the address is not a valid trap
        IDrosera(drosera).getRewardAddress(msg.sender);

        address user = ITrapConfig(msg.sender).owner();
        if (!responders[user]) {
            responders[user] = true;
            emit Responded(user);
        }
    }

    function isResponder(address _user) external view returns (bool) {
        return responders[_user];
    }
}
