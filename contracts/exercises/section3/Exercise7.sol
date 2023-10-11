// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Write a function to get the current block number
// and add it to the Ether sent when calling the function.

contract Exercise7 {
    function blockNumberEther() public payable returns (uint) {
        return (block.number + msg.value);
    }
}
