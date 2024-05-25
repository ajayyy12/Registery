# Registry Contract
This is a simple Solidity smart contract for managing a registry of hardware items. It includes functionality to store and remove items, with certain constraints to ensure the integrity of the registry.

## Overview
The contract registery allows the owner to store information about hardware items, including their ID, name, and quantity. It also allows for the removal of items, ensuring that the quantity never drops below zero. The contract is designed to be used on the Ethereum blockchain.

### Features
- Owner-Only Storage: Only the owner of the contract can store items in the registry.
- Quantity Limit: Each item can have a maximum of 10 units.
- Range Check: Items can only be removed if their ID is within a specified range (1 to 24).
- Non-Negative Quantity: The contract ensures that the quantity of any item does not fall below zero.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., registery.sol). Copy and paste the following code into the file:

```javascript
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile registery.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "registery" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it .
## Authors

Ajay SS

[@0j0y1512@gmail.com]

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
