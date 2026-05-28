// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple bank contract
contract Bank {

    uint public balance;

    // Function to deposit amount
    function deposit(uint amount) public {
        balance += amount;
    }

    // Function to withdraw amount
    function withdraw(uint amount) public {
        balance -= amount;
    }
}
