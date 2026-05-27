// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A contract to store student details
contract StudentRecord {

    string public studentName;

    // Function to set student name
    function setStudent(string memory _name) public {
        studentName = _name;
    }
}
