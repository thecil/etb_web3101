// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a simplified token contract to keep track of balances
// and declare a function to transfer these tokens from the sender to the recipient.

contract Exercise17 {
    error ZeroAddress();
    error InvalidRecipient(address);
    error InvalidAmount(uint256);
    mapping(address => uint256) public balanceOf;

    modifier notZeroAddress(address _addr) {
        if (_addr == address(0)) revert ZeroAddress();
        _;
    }

    modifier invalidRecipient(address _to) {
        if (_to == msg.sender) revert InvalidRecipient(_to);
        _;
    }
    modifier invalidAmount(uint256 _amount) {
        if (_amount <= balanceOf[msg.sender]) revert InvalidAmount(_amount);
        _;
    }

    constructor() {
        balanceOf[msg.sender] = 10 ether;
    }

    function transfer(
        address _to,
        uint256 _amount
    ) public notZeroAddress(_to) invalidRecipient(_to) invalidAmount(_amount) {
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
    }
}
