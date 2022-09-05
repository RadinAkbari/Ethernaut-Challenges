// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

//Unlock the vault to pass the level!

// await web3.eth.getSorageAt("0xc45411385c3CE0994Ad222154a7C9814f8947C7e",1)

// await contract.unlock("0xc45411385c3CE0994Ad222154a7C9814f8947C7e")