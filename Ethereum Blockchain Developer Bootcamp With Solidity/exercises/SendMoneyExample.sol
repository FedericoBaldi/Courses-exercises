//SPDX-License-Identifier: GPL 3.0
pragma solidity  ^0.8.11;

contract SendMoneyExample {

    uint public balanceReceived;
    
    //by adding "payable" it means the function will receive money(ETH)
    function receiveMoney() public payable{
        balanceReceived += msg.value; //you can get information from messages properies
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable to = payable(msg.sender);

        to.transfer(this.getBalance());
    }

    // the one who pays the gas fee is always the one who initiated the transaction/function
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}