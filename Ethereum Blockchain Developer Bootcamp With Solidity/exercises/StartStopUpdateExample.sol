//SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.12;

contract StartStopUpdateExample {
    address owner;
    bool paused; //initialized as default false

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public{
        require(msg.sender == owner, "You are not the owner, you cannot withdraw");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner, "You are not the owner, you cannot destroy this");
        selfdestruct(_to);
    }
}