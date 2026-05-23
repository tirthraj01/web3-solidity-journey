// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A simple voting contract
contract Voting {

    uint public voteCount;

    // Function to increase vote count
    function vote() public {
        voteCount += 1;
    }

    // Function to check total votes
    function getVotes() public view returns(uint) {
        return voteCount;
    }
}
