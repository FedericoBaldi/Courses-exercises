//SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.12;

contract EventExample{ //simplified version of InheritanceModifierExample.sol
    mapping(address => uint) public tokenBalance;

    event TokenSent(address _from, address _to, uint amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool){
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit TokenSent(msg.sender, _to, _amount); // put the data in ABI array
        return true; // the return will not work on a real(or test) blockchain, we will use events
    }
}