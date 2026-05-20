// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {

    uint public count = 0;

    // Increase count
    function increment() public {
        count += 1;
    }

    // Decrease count
    function decrement() public {
        count -= 1;
    }

    // Set custom value
    function setCount(uint _value) public {
        count = _value;
    }

    // Read count
    function getCount() public view returns (uint) {
        return count;
    }
}
