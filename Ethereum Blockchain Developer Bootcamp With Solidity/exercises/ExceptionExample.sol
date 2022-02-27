//SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.12;

contract ExceptionExample {
    mapping(address => uint64) public balanceReceived;
    
    function receiveMoney() public payable {
        // an example of how to use assert
        // if you want to spend less gas fee you can use uint64 but you need to secure your operations from overflow
        // assert is used for type checking and robust coding
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }
    
    function withdrawMoney(address payable _to, uint64 _amount) public {
        /*if (_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }*/ // instead of this we want to give a feeback to the caller.
        require(_amount <= balanceReceived[msg.sender], "You don't have enough Eth");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}