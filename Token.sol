// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
    //
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}
//hint => what is an odometer?
// objective : You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.
/**Integer Overflow
if the amount of transfer exceeds the balance , the balance that is a uint will become negative  and then because uint can not be negative
it cycles back to the end of it and all of the total supply will be our new balance after transfering to another random address that we found on etherscan
 */