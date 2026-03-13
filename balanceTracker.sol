// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceTracker {

    mapping(address => uint) public balances;

    function deposit(uint amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance(address user) public view returns(uint) {
        return balances[user];
    }
}
