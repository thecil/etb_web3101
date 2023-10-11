// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Exercise2 {
    event Deposit(address indexed sender, uint amount);

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value);
    }
}
