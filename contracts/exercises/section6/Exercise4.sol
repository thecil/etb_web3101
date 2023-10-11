// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a child contract that inherits from the above parent contract
// and overrides the function "setValue" whereby the value of a is 100,
//  b is 200 so the sum of a + b would be 300.
//  Also, implement a new function called "getValue"
//  that returns the value of sum

contract Parent {
    uint internal sum;

    function setValue() external virtual {
        uint a = 1;
        uint b = 2;
        sum = a + b;
    }
}

contract ExerciseInheritance is Parent {
    function setValue() external override {
        uint a = 100;
        uint b = 200;
        sum = a + b;
    }

    function getValue() external view returns (uint) {
        return sum;
    }
}
