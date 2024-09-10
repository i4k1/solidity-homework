// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract stormem {
    uint public numberPlus;

    function testMemory(uint _input) public pure returns(uint) {
        return _input * 2;
    }

    function testStorage(uint _input) public returns(uint) {
        numberPlus += _input;
        return numberPlus;
    }
}
