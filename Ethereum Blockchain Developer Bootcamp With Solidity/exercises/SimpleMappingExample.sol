//SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.12;

contract SimpleMappingExample {
    // instead of having a lot of single variables you may want to group them with a map
    /*
    bool myVar1 = false;
    bool myVar2 = false;
    bool myVar3 = false;

    function setMyVar1ToTrue() public {
        myVar1 = true;
    }
    .....
    */
    // all the keys have a default value
    mapping(uint => bool) public myMapping; // first is the key, second is the value
    mapping(address => bool) public myAddresMapping; // it may be used to have a white list of addres that can do stuff

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddresMapping[msg.sender] = true;
    }
}