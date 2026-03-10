// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract TirthtCoin{
    address public owner;
    mapping(address => uint) public balances;
    uint public totalSupply;

    constructor(){
        owner = msg.sender;
    }

    function getBalances(address account) public view returns(uint){
        return balances[account];
    }
    function mint( uint amount) public {
        require((owner ==msg.sender));
        balances [owner] += amount;
        totalSupply += amount;
    }

    function mintTo(uint amount , address to) public {
        require(owner == msg.sender);
        balances[to] += amount;
        totalSupply += amount;
    }

    function transfer(uint amount , address to) public {
        uint existingBalances =  balances[msg.sender];
        require((existingBalances >= amount));
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

}
