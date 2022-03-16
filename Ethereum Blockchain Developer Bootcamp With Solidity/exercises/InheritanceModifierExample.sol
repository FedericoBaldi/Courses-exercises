//SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.12;

// of course, you can put the class in another file and import it
// import "./Owned.sol"
contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _; // the function modified has the code copyed and pasted here and then everything back
    }
}

contract InheritanceModifierExample is Owned{ // you can inherit multiple classes
    mapping(address => uint) public tokenBalance;
    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    /*modifier onlyOwner() { you can have it here or create a separate contract
        require(msg.sender == owner, "You are not allowed");
        _; // the function modified has the code copyed and pasted here and then everything back
    }*/

    function createNewToken() public  onlyOwner{
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}