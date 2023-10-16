// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Counter {
  uint256 public num;

  function increment() external {
    num += 1;
  }
}

contract CounterInteraction {
  Counter public myCounter;

  constructor(address counterAddress) {
    myCounter = Counter(counterAddress);
  }

  function counterIncrement() external {
    myCounter.increment();
  }
}