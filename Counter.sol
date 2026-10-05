// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    // Increase the count by 1
    function increment() public {
        count += 1;
    }

    // Decrease the count by 1 (will fail if count is 0)
    function decrement() public {
        require(count > 0, "Counter cannot go below zero");
        count -= 1;
    }

    // Reset the count to 0
    function reset() public {
        count = 0;
    }
}
