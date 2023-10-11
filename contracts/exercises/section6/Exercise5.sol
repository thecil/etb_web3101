// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create an abstract contract called "SayHello" that doesn't implement the "setAge" function
// (to set the state variable called "age") but does implement the "makeMeSayHello" function that just returns "Hello".
// The constructor should have one argument that is going to be
// used to set the value of the state variable "age" upon deployment.

abstract contract SayHello {
    uint public age;

    constructor(uint _age) {
        age = _age;
    }

    function setAge(uint _age) public virtual {}

    function makeMeSayHello() public pure returns (string memory) {
        return "hello";
    }
}

contract Solution is SayHello {
    string public name;

    constructor(string memory _name, uint _age) SayHello(_age) {
        name = _name;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function setAge(uint _age) public override {
        age = _age;
    }
}
