// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    string public name = "KiratCoin";
    uint public supply = 0;
    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }
    
    function mintTo(address to, uint amount) public {
        require(msg.sender == owner);
        balances[to] += amount;
        supply += amount;
    }

    function transfer(address to, uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount, "You dont have enough baance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function burn(uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount, "You dont have enough baance");
        balances[msg.sender] -= amount;
        supply -= amount;
    }
    
}
