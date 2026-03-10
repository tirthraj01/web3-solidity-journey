// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Will {

    address public owner;
    address public recipient;
    uint256 public lastPing;

    uint256 constant ONE_YEAR = 365 days;

    constructor(address _recipient) payable {
        owner = msg.sender;              // Deployer becomes owner
        recipient = _recipient;          // Set recipient
        lastPing = block.timestamp;      // Initialize last ping
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
