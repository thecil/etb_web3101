// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Update the “Escrow” contract from the lecture in the following ways:
// - The seller can be multiple people. You may need to keep track of this using an array
// - The escrow party address can be changed to a different address at any point in the future with a new function called “changeEscrow” that should only able to be called if you’re an escrow party yourself
// - Anyone should be able to deposit to the escrow and not just the buyer
// - You should be able to send any amount of money to the escrow. It doesn’t need to be the exact amount
// - You may also need to update the release function to account for the above new conditions
// - Releasing the escrow funds will send Ether to the multiple sellers if any in equal ratio

contract Escrow {
    address public buyer;
    // - The seller can be multiple people. You may need to keep track of this using an array
    address payable[] public sellers;

    address public escrowParty;
    uint256 public amount;

    modifier onlyEscrowParty() {
        require(msg.sender == escrowParty, "Only escrow party allowed");
        _;
    }

    constructor(
        address _buyer,
        address payable[] memory _sellers,
        uint256 _amount
    ) {
        buyer = _buyer;
        sellers = _sellers;
        escrowParty = msg.sender;
        amount = _amount;
    }

    function balanceOf() public view returns (uint256) {
        return address(this).balance;
    }

    // - The escrow party address can be changed to a different address at any point in the future, only able to be called if you’re an escrow party yourself
    function changeEscrowParty(address _addr) public onlyEscrowParty {
        escrowParty = _addr;
    }

    // - Anyone should be able to deposit to the escrow and not just the buyer
    function deposit() public payable {}

    // - You may also need to update the release function to account for the above new conditions
    // - Releasing the escrow funds will send Ether to the multiple sellers if any in equal ratio
    function release() public onlyEscrowParty {
        require(
            address(this).balance >= amount,
            " cannot release funds before full amount is sent"
        );
        for (uint256 i = 0; i < sellers.length - 1; i++) {
            sellers[i].transfer(amount / sellers.length);
        }
    }
}
