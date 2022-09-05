// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
// what we have to do is to create an attack contract and import the contract and the function and then we set a constructor that gets the contract address and then we create an attack function that sets the changeOwner to the msg.sender address so the tx`s origin is not the contract that we want to set as the owner