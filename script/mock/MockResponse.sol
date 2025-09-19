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
    string[] discordNames;

    mapping(address => bool) public responders;

    event DiscordNameAdded(address indexed user, string name);

    constructor(address _drosera) {
        active = true;
        drosera = _drosera;
    }

    function isActive() external view returns (bool) {
        return active;
    }

    function respondWithDiscordName(string memory _name) external {
        // reverts if the address is not a valid trap
        IDrosera(drosera).getRewardAddress(msg.sender);

        address user = ITrapConfig(msg.sender).owner();
        if (!responders[user]) {
            discordNames.push(_name);
            emit DiscordNameAdded(user, _name);
        }
        responders[user] = true;
    }

    function isResponder(address _user) external view returns (bool) {
        return responders[_user];
    }

    function getDiscordNamesBatch(uint256 _startIndex, uint256 _batchSize) external view returns (string[] memory) {
        require(_startIndex < discordNames.length, "Start index out of bounds");

        uint256 endIndex = _startIndex + _batchSize;
        if (endIndex > discordNames.length) {
            endIndex = discordNames.length;
        }

        string[] memory batch = new string[](endIndex - _startIndex);

        for (uint256 i = _startIndex; i < endIndex; i++) {
            batch[i - _startIndex] = discordNames[i];
        }

        return batch;
    }

    function getDiscordNamesCount() external view returns (uint256) {
        return discordNames.length;
    }
}
