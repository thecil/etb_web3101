// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Find a way to declare two variables of the same name(one state variable and anoher local variable)
// and set the value of local variable to whatever the value of the state variable is and return the value.

contract Exercise10 {
    uint public data = 100;

    function scoping() public view returns (uint) {
        uint data = data;
        return data;
    }
}
