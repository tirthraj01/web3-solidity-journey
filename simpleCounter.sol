
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {
    // State variable to store the count permanently on the blockchain
    uint256 private count;

    // Constructor runs once when the contract is deployed
    constructor() {
        count = 0;
    }

    // Function to increase the count by 1
    function increment() public {
        count += 1;
    }

    // Function to decrease the count by 1 (with a check to prevent negative values)
    function decrement() public {
        require(count > 0, "Count is already zero");
        count -= 1;
    }

    // Function to view the current count
    function getCount() public view returns (uint256) {
        return count;
    }
}
