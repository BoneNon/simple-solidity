// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Election{
    mapping (string => uint256) public votes;
    mapping (address => bool) public isVote;

    constructor(string[] memory _parties) {
        for (uint256 i = 0; i < _parties.length; i++){
            votes[_parties[i]] = 0;
        }
    }

    function vote(string memory _party) public {
        require(!isVote[msg.sender],"You already vote");
        votes[_party] += 1;

        isVote[msg.sender] = true;
    }
}