// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a function called "buy" where the amount of Ether sent
// has to be exactly the amount it costs to purchase the item;
// You can use either the "require" or the "revert" statement

contract Exercise18 {
    uint public constant cost = 0.5 ether;

    error IncorrectCost(uint256);
    error AlreadyPurchased(address);

    mapping(address => bool) public purchased;

    modifier incorrectCost(uint256 _amount) {
        if (_amount < cost) revert IncorrectCost(_amount);
        _;
    }

    modifier alreadyPurchased() {
        if (purchased[msg.sender] == true) revert AlreadyPurchased(msg.sender);
        _;
    }

    function buy() public payable incorrectCost(msg.value) alreadyPurchased {
        purchased[msg.sender] = true;
    }

    receive() external payable alreadyPurchased incorrectCost(msg.value) {
        purchased[msg.sender] = true;
    }

    fallback() external payable alreadyPurchased incorrectCost(msg.value) {
        purchased[msg.sender] = true;
    }
}
