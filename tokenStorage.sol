// SPDX-License-Identifier: MIT
//Version used (0.8.0)
pragma solidity ^0.8.0;

//Contract name 
contract Storage {

    // State variable to store a number
    uint public storedNumber;

    // Function to set the number
    function setNumber(uint _number) public {
        // Assign the value 
        storedNumber = _number;
    }

    // Function to get the stored number
    function getNumber() public view returns (uint) {
        return storedNumber;
    }
}
