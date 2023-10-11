// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Define a struct within a struct.

contract Exercise16 {
    struct Country {
        string name;
        uint location;
    }

    struct Citizen {
        string name;
        uint age;
        address payable wallet;
        Country nationality;
    }

}
