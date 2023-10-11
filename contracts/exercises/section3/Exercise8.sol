// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Write a constructor that takes in 2 arguments of types uint and string
// and sets the state variable values to these passed-in values in the constructor.

contract Exercise8 {
    string public text;
    uint public number;

    constructor(string memory _text, uint _number) {
        text = _text;
        number = _number;
    }
}
