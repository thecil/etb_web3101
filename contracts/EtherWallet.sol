// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Gonna let one person(the deployer) able to send and withdraw from the wallet
// Single person Ether Wallet
// Implement the "deposit()" and "send()" function
// Implement the "balanceOf" to retreive the current balance in the wallet

// Update the “EtherWallet” contract from the lecture so that anyone can send and withdraw from the wallet.
// Rather than it being a single person Ether wallet, make it so that it is a wallet that can be used by multiple people.
// You will need to keep track of balances for each user using mapping.

contract EtherWallet {
    mapping(address => uint) public balanceOf;
    error NotEnoughBalance(uint);

    modifier validAmount(uint _amount) {
        if (_amount > balanceOf[msg.sender]) revert NotEnoughBalance(_amount);
        _;
    }

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public validAmount(_amount) {
        address payable receiver = payable(msg.sender);
        balanceOf[msg.sender] -= _amount;
        receiver.transfer(_amount);
    }

    function send(address _to, uint _amount) public validAmount(_amount) {
        balanceOf[msg.sender] -= _amount;
        payable(_to).transfer(_amount);
    }

    function contractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
