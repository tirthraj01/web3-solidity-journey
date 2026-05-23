// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple contract to store student details
contract StudentData {

    string public studentName;
    uint public studentAge;

    // Function to set student details
    function setStudent(string memory _name, uint _age) public {
        studentName = _name;
        studentAge = _age;
    }

    // Function to get student details
    function getStudent() public view returns(string memory, uint) {
        return (studentName, studentAge);
    }
}
