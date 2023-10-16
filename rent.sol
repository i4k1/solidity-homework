// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract Rent {
  address payable public landlord;
  string public tenantName;
  uint public tenantAge;
  string public tenantOccupation;

  constructor (string memory name, uint age, string memory occupation) {
    tenantName = name;
    tenantAge = age;
    tenantOccupation = occupation;
    landlord = payable(msg.sender);
  }

  receive() external payable {
    landlord.transfer(msg.value);
  }
}