// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Account {
    string public role;

    constructor(string memory _role) {
        role = _role;
    }

    function getRole() public view returns (string memory) {
        return role;
    }

    function performAction() public virtual returns (string memory);
}

contract UserAccount is Account {
    constructor() Account("User") {}

    function performAction() public pure override returns (string memory) {
        return "User performing action";
    }
}

contract AdminAccount is Account {
    constructor() Account("Admin") {}

    function performAction() public pure override returns (string memory) {
        return "Admin performing action";
    }
}

interface IDeliveryProvider {
    function calculateDeliveryCost(uint distance) external view returns (uint);
    function deliverGoods(uint distance) external view returns (uint);
}

contract FastDelivery is IDeliveryProvider {
    function calculateDeliveryCost(uint distance) external pure override returns (uint) {
        return distance * 5;
    }

    function deliverGoods(uint distance) external view override returns (uint) {
        return this.calculateDeliveryCost(distance);
    }
}

contract EconomyDelivery is IDeliveryProvider {
    function calculateDeliveryCost(uint distance) external pure override returns (uint) {
        return distance * 2;
    }

    function deliverGoods(uint distance) external view override returns (uint) {
        return this.calculateDeliveryCost(distance);
    }
}
