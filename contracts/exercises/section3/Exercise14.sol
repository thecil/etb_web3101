// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create two functions in the following ways:
// 1. Create a function that takes in an array of unsigned integers called “arr1” that returns the values of “arr1” immediately.
// 1. Note: You will need to utilize the “memory” data location
// 2. Create a function that takes in an array of unsigned integers called “arr2” that returns the values of “arr2” immediately
// 2. but with one difference being thaat it should avoid copying the values in memory within the function.

contract Exercise14 {
    function fOne(uint[] memory arr1) public pure returns (uint[] memory) {
        return arr1;
    }

    function fTwo(uint[] calldata arr2) public pure returns (uint[] memory) {
        return arr2;
    }
}
