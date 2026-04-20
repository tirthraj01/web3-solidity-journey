// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract balanceTracker{

    mapping(address => uint256) public balance;
    function deposit(uint256 amount) public  {
        balance[msg.sender] += amount;

    }
    function withdraw(uint amount) public {
        require(balance [msg.sender] >= amount , "Insufficient Balance" );
        balance[msg.sender] -= amount;
    }

    function CurrentBalance(address user) public view returns (uint256) {
        return balance[user];
    }
}
