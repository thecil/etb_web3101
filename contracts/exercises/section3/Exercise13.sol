// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a modifier function that checks that the address passed in is not the zero address.

contract Exercise13 {
    modifier nonZeroAddress(address _address) {
        require(_address != address(0), "Not valid address");
        _;
    }
}
