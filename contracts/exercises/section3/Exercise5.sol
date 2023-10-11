// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Exercise5 {
    uint result;

    function getResult() public view returns (uint) {
        return result;
    }

    function setResult(uint x, uint y) public {
        result = x + y;
    }
}
