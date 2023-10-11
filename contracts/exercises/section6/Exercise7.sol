// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a library called "MathLibrary" that implements a function called "multiply"
// that multiples the two arguments being passed to the function and returns two values:
// - the result of that multiplication
// - the address of the smart contract that's currently calling the library function

library MathUtils {
    function multiply(uint _a, uint _b) public view returns (uint, address) {
        return (_a * _b, address(this));
    }
}

contract Exercise7 {
    using MathUtils for uint;

    function useLib() public view returns (uint, address) {
        uint a = 2;
        uint b = 3;
        return a.multiply(b);
    }
}
