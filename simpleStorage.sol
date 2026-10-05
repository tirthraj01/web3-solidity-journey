// SPDX-License-Identifier: MIT
pragmapragma solidity ^0.8.0;

contract SimpleStorage {
    // Variable to store our number
    uint256 private storedData;

    // Function to change the value of the variable
    function set(uint256 x) public {
        storedData = x;
    }

    // Function to read the value of the variable
    function get() public view returns (uint256) {
        return storedData;
    }
}
