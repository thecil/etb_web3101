// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// It is known that when you delete an item from the array, it creates a gap in the array.
// Create a function that removes an item in the array without creating any gap in the array.

contract Exercise14 {
    uint[] public arr;

    constructor(uint[] memory _arr) {
        arr = _arr;
    }

    function removeItem(uint _idx) public {
        require(_idx < arr.length, "index out of array bound");

        for (uint i = _idx; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }
}
