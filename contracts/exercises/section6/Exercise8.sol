// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// Create a functtion called "testCallFoo" whereby it takes the address of a smart contract as an argument
// (in our case, it would be the address of the above Receiver contract)
// and uses the "call" function to send ETH to the Receiver contract.
// The "call" function should also set the amount of gas to use
// and it should also call the function "foo" of the Receiver smart contract with the arguments ("call foo", 123)

contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    receive() external payable {}

    function foo(
        string memory _message,
        uint _x
    ) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

contract Exercise8 {
    event Response(bool success, bytes data);
    error SendFailed(bool success, bytes data);

    function testCallFoo(address payable _to) public payable {
        (bool send, bytes memory data) = _to.call{gas: 5000, value: msg.value}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        if (!send) revert SendFailed({success: send, data: data});
        emit Response({success: send, data: data});
    }
}
