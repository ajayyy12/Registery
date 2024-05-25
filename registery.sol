//SPDX-License-Identifer:MIT
pragma solidity ^0.8.9;

contract registery{

    mapping(uint=>string) public hardwaremap;
    mapping(uint=>uint)public no_items;
    address owner;

    function store(uint id, string memory name, uint number )public {
        require(number<10,"Each item can have a maximum of 10 items each");
        if(msg.sender!=owner){
            revert("You cannot store, you need to be the owner");
        }
        hardwaremap[id]=name;
        no_items[id]=number;
    }

    function remove(uint id)public {
        assert(id>0 && id<25);
        no_items[id]--;
        require(no_items[id]>0,"0 items left");
    }
}
