// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Write a function that takes an unsigned integer x as a parameter, goes through a loop 10 times,
// and adds the previous value of x to itself and returns the final sum. If the value of x is 0, return 100.

contract Exercise9 {
    function loopValue(uint x) public pure returns (uint) {
        if (x == 0) return 100;
        uint result = x;
        for (uint i = 0; i < 10; i++) {
            result += result;
        }
        return result;
    }
}
