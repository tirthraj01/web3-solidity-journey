// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple wallet contract to deposit ETH and check balance
contract SimpleWallet {

    // Function to deposit ETH into the contract
    function deposit() public payable {}

    // Function to check the contract's ETH balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
