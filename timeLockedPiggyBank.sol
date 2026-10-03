// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PiggyBank {
    address public owner;
    uint256 public withdrawTime;

    // Event to log deposits on the blockchain
    event Deposit(address indexed sender, uint256 amount);
    // Event to log withdrawals
    event Withdraw(uint256 amount);

    // Constructor sets the owner and a lock time (e.g., 30 days from deployment)
    constructor(uint256 _durationInDays) {
        owner = msg.sender;
        withdrawTime = block.timestamp + (_durationInDays * 1 days);
    }

    // Function to deposit money into the piggy bank
    // The 'payable' keyword allows this function to receive Ether
    function deposit() public payable {
        require(msg.value > 0, "You must send some Ether");
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw all funds
    function withdraw() public {
        // 1. Enforce rules using 'require'
        require(msg.sender == owner, "You are not the owner");
        require(block.timestamp >= withdrawTime, "The piggy bank is still locked");

        uint256 amount = address(this).balance;
        require(amount > 0, "No funds to withdraw");

        // 2. Transfer the funds to the owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdraw(amount);
    }

    // Function to check the current balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
