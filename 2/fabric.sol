// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/i4k1/buyer-contract/blob/main/buyer.sol";
import "https://github.com/charmantemortt/game-solidity/blob/blockchain/minecraft.sol";
import "https://github.com/str0nggyyy/enum_test/blob/main/enumtest.sol";

contract Fabric {
    address public buyerContract;
    address public minecraftContract;
    address public enumTestContract;

    string public buyerName;
    uint public buyerAge;
    uint public buyerBalance;
    string public minecraftName;

    constructor(string memory _buyerName, uint _buyerAge, uint _buyerBalance, string memory _minecraftName) {
        buyerName = _buyerName;
        buyerAge = _buyerAge;
        buyerBalance = _buyerBalance;
        minecraftName = _minecraftName;
    }

    function createBuyer() public {
        Buyer newBuyer = new Buyer(buyerName, buyerAge, buyerBalance);
        buyerContract = address(newBuyer);
    }

    function createMinecraft() public {
        Minecraft newMinecraft = new Minecraft(minecraftName);
        minecraftContract = address(newMinecraft);
    }

    function createEnumTest() public {
        EnumTest newEnumTest = new EnumTest();
        enumTestContract = address(newEnumTest);
    }

    function callBuyerFunction() public {
        require(buyerContract != address(0), "Buyer contract not deployed");
        Buyer(buyerContract).changeStatus();
    }

    function callMinecraftFunction() public {
        require(minecraftContract != address(0), "Minecraft contract not deployed");
        Minecraft(minecraftContract).changeMode(Minecraft.Mode.Hard);
    }

    function callEnumTestFunction() public {
        require(enumTestContract != address(0), "EnumTest contract not deployed");
        EnumTest(enumTestContract).setLifeStatus(EnumTest.LifeStatus.Dead);
    }
}
