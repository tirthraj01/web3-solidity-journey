// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    string public name = "KiratCoin";
    uint public supply = 0;
    address public owner;
    mapping(address => uint) public balances;
    mapping(address account => mapping(address sender =>  uint)) public allowance;

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
        require(balance >= amount, "You dont have enough banana");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function burn(uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount, "You dont have enough baance");
        balances[msg.sender] -= amount;
        supply -= amount;
    }

    function allow(address to, uint amount) public {
        allowance[msg.sender][to] = amount; 
    }

    function transferFrom(address from, address to, uint amount) public {
        uint balance = balances[from];
        require(balance >= amount);
        uint currentAllowance = allowance[from][msg.sender];
        require(currentAllowance >= amount);

        balances[from] -= amount;
        balances[to] += amount;
        allowance[from][msg.sender] -= amount;
    }
    
}
