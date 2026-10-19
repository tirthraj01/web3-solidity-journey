// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CommitReveal
 * @dev Implements a secure Commit-Reveal pattern to prevent front-running.
 */
contract CommitReveal {
    
    struct Commit {
        bytes32 commitHash;
        uint256 blockNumber;
        bool revealed;
    }

    // Maps user address to their specific commitment
    mapping(address => Commit) public userCommits;

    // Minimum blocks that must pass before revealing (prevents same-block front-running)
    uint256 public constant MIN_BLOCK_DELAY = 1;
    // Maximum blocks allowed to pass before the commit expires (e.g., 250 blocks ~1 hour on Ethereum)
    uint256 public constant MAX_BLOCK_DELAY = 250;

    // Events
    event Committed(address indexed user, bytes32 commitHash, uint256 blockNumber);
    event Revealed(address indexed user, string choice, uint256 secret);

    /**
     * @notice Step 1: Submit the commitment hash.
     * @dev The hash should be generated off-chain using keccak256(abi.encodePacked(choice, secret, msg.sender))
     * @param _commitHash The cryptographic hash of the user's hidden choice and secret.
     */
    function commit(bytes32 _commitHash) external {
        require(_commitHash != bytes32(0), "Invalid hash");
        
        userCommits[msg.sender] = Commit({
            commitHash: _commitHash,
            blockNumber: block.number,
            revealed: false
        });

        emit Committed(msg.sender, _commitHash, block.number);
    }

    /**
     * @notice Step 2: Reveal the choice by providing the plain text values.
     * @param _choice The original choice/action (e.g., "vote_yes", "bid_100").
     * @param _secret A random uint256 salt used to make the hash unique.
     */
    function reveal(string calldata _choice, uint256 _secret) external {
        Commit storage userCommit = userCommits[msg.sender];

        // 1. Validations
        require(userCommit.blockNumber > 0, "No commit found");
        require(!userCommit.revealed, "Already revealed");
        require(block.number >= userCommit.blockNumber + MIN_BLOCK_DELAY, "Reveal too early");
        require(block.number <= userCommit.blockNumber + MAX_BLOCK_DELAY, "Commit expired");

        // 2. Verify the hash matches
        bytes32 calculatedHash = keccak256(abi.encodePacked(_choice, _secret, msg.sender));
        require(calculatedHash == userCommit.commitHash, "Hash mismatch: Invalid secret or choice");

        // 3. Effects
        userCommit.revealed = true;

        // 4. Interactions (Trigger the intended logic here)
        emit Revealed(msg.sender, _choice, _secret);
        
        // Example: executeChoiceLogic(_choice);
    }

    /**
     * @notice Helper function to generate commit hash on-chain (or to verify format off-chain).
     */
    function getHash(string calldata _choice, uint256 _secret, address _wallet) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_choice, _secret, _wallet));
    }
}
