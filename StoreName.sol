// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple contract to store a name
contract NameStorage {

    string public name;

    // Function to store name
    function setName(string memory _name) public {
        name = _name;
    }

    // Function to retrieve stored name
    function getName() public view returns(string memory) {
        return name;
    }
}
