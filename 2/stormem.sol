// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract stormem {
    uint public numberPlus;

    function testMemory(uint input) public pure returns (uint) {
        uint result = input * 2;
        return result;
    }

    function testStorage(uint input) public returns (uint) {
        numberPlus += input;
        return numberPlus;
    }
}
