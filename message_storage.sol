// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple smart contract to store and retrieve a message
contract MessageStore {

    string public message;

    function setMessage(string memory _message) public {
        message = _message;
    }

    function getMessage() public view returns(string memory) {
        return message;
    }
}
