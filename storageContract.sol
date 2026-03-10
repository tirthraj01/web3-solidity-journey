// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint public storedNmber;

    function setNumber(uint _number) public {
        storedNmber = _number;
    }

    function getNumber() public view returns (uint){
        return storedNmber;
    }

}
