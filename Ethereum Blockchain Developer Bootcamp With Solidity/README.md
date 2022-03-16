# Blockchain ETH notes

These are notes I take in Notion, and then export in .md format

- Peer to Peer transfer, without a middleman
    
    Possession = Ownership
    
- Tracking in a simple Ledger

Ownership ≠ Possession → Double spending problem, someone can manipulate the ledger

- Why BlockChain is revolutionary?
    1. Smart Contracts, secure and reliable way of creating exchanges and contracts.
    2. Cuts every middleman
    3. Fasten every kind of transactions
    4. Increase the Capacity and scalability of solutions

BlockChain is like Google Docs, it is like a shared document. You don't need to lock access to the ledger of a bank when you are modifying it.

MetaMask extension as a wallet to receive and send ETH

MetaMask is connected to Infura - Blockchain as a service provider. They have internal nodes running in the background. They open a restful API to interact with the Blockchain via a node they are hosting.

How can the Blockchain know to send a transaction? Through signatures.

- after we send a transaction (function) we will get 3 parameters. V,R,S
    
    ![imgTransaction.jpg](Blockchain%20fdf03/imgTransaction.jpg)
    
- Hash in short
    
    There are a lot of hash functions, an ideal hash function is:
    
    1. it is deterministic, same input = same output.
    2. it is quick to compute.
    3. it is not possible to generate a message from its hash value except by brute force.
    4. it is uncorrelated, a small change to a message completely changes the output.
    5. it is not possible to find two messages with the same hash value.

A block in the Blockchain has hashes of the previous block which has hashes of the previous block and so on. That's why it is secure because the blocks are chained together.

Solidity: is an object-oriented, high-level language for implementing smart contracts

### Smart Contract

A piece of code running on the blockchain

- it's a state machine
- needs transactions to change state
- can do logic operations
- they are Turing complete

Multiple programming languages for smart contracts: Solidity, Vyper, Serpent, LLL → once code is compiled, they produce EVM bytecode that can run on the blockchain.

Every Ethereum node in the network executes the same code because every node has a copy of the chain.

- [Remix](https://remix.ethereum.org/) online geditor and compiler
    
    Used to write, compile and Deploy Smart Contracts
    
    - to deploy Smart Contracts you can use 3 different options:
        
        JavaScript VM - on web testing environment provided by Remix → fast, easy, but not 100% under control and editable.
        
        Injected Web 3 - by MetaMask use real Ethereum BlockChain or testing public BlockChains → close to real-world scenario, but slow
        
        Web3 Provider - by using [Ganache](https://trufflesuite.com/ganache), you can have a local BlockChain and debug on it. → fast, medium complicated, more flexible, and editable.
        

Used to write, compile and Deploy Smart Contracts

- to deploy Smart Contracts you can use 3 different options:
    
    JavaScript VM - on web testing environment provided by Remix → fast, easy, but not 100% under control and editable.
    
    Injected Web 3 - by MetaMask use real Ethereum BlockChain or testing public BlockChains → close to real-world scenario, but slow
    
    Web3 Provider - by using [Ganache](https://trufflesuite.com/ganache), you can have a local BlockChain and debug on it. → fast, medium complicated, more flexible, and editable.
    

## Blockchain Nodes

There are different implementations of an Ethereum Node with different programming languages. What matters is that they all use the Ethereum Protocol to talk with each other.

- You can create a private Ethereum Network with private Nodes.
    
    a company, a bank can create their own Eth network and have their own data.
    
    it is possible to branch from the main network and start with a data state of the main network and from there on continue with private network data.
    
    however you start, you start with a Genesis Block, the first block written to the network. It comes from a Genesis file, it is the configuration for the Genesis Block, every other blocks are built upon the first one. It is the only thing you need to configure if you want to start your own network.
    

## Solidity

Resources in the resources folder

- Smart Contract states
    - smart contracts get compiled and sent to the blockchain as a transaction.
    - it’s always good to save the owner of the smart contract, the one that created the contract in the deployment. You can save the address of “msg.sender” in the constructor as the owner.
    - with “require” we can add controls to our functions. it is like an “if-else exception”.
    - if we want to destroy/stop a smart contract, we can create a function that calls “selfdestruct” receiving an address where to send the remaining Eth. Of course, we can not really destroy a smart contract because once mined, the blockchain is immutable. We are just going to remove it from the state, it will not available in the blocks afterward anymore.
- Variables
    
    all variables get initialized with their default → int 0, string empty,...
    
    any value/balance you will have, it will be in $wei = 10^{-18}Eth$
    
    Public variables generate a getter function automatically.
    
    Keep in mind you have very limited resources. Gas fees are expensive
    
    - Types
        - bool classic booleans.
        - uintX or intX where X is 8,16,32,64,128,256. uint by default is 256.
        - fixed point not implemented yet. Good practice → uint numTokens = 10000 uint decimalPoints = 2. Use 2 variables to handle floats, doubles.
        - address, every interaction is address base. Used to transfer ether from smart contracts to addresses or other smart contracts. They already have a lot of built-in functions (transfer, send, call.value, delegatecall, ecc)
        - string is internally stored as byte arrays, they are then converted in utf when you need them. you cannot do a lot of stuff, like concatenate, search, replace, etc. They are expensive, gas fee-wise.
        - mapping is the corresponding hash map. mapping(int ⇒ int) name; it can be any Solidity type.
        - to create your how struct it’s easy(very C like):
        of course, struct consumes fewer gas fees than creating a custom class.
        
        ```solidity
        struct Funder {
        address addr; 
        uint amount;
        }
        ```
        
        - arrays can be fixed or dynamic size. usually is better to use maps because of gas fees.
        - enums are one way to create a user-defined type in Solidity. They are uint8 internally.
    
    Every time you have a string or any other reference type, you have to specify where you store it. “memory” = this variable will be stored in the memory and not in a storage variable(of course cheaper). The alternative is “storage”.
    
- Functions
    
    adding “payable” to a function means it is going to receive money
    
    you can get information, like the value of a transaction, by getting the messages properties→ msg.value msg is a Global Object
    
    the one who pays the gas fee is always the one who initiated the transaction/function
    
    every transaction/function is atomic and can interact with other contracts or owned accounts
    
    - constructor function is called only during deployment
    - a view function is a "read-only" function, of course, it can call other view and pure functions. 
    a pure function is a function that does not interact with store variables in the contract. why should we declare this kind of function? not writing functions are gas-free, the nodes in the blockchain don’t need to be notified.
    - fallback function called if the contract receives Ether directly called with non-empty calldata.
    receive function same as fallback but called when empty calldata
    - public: can be called internally and externally
    - private: only for the contract
    - external: can be called from other contracts, can be called externally
    - internal: only for the contract and its derived contracts
    
     “return” will not work on a real(or test) blockchain, we will use events
    
    an Event is used for return values from transactions, it is used externally to trigger functionality or used as a cheap data storage(better than save something inside the contract, gas cost wise). They can allow interaction with the contract.
    
    Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.
    
    Storing data is extremely expensive ⇒ you can store data off-chain and story only a proof(hash), you can store data in another blockchain such as IPFS or store data in event logs if not necessary.
    
- Transactions and Errors
    
    transactions are atomic, errors are “state reverting”. Errors mean something triggered an handled error like “require”, “assert”, “revert”. They cascade even between smart contracts and multiple functions, except for low level functions (address.send, ....).
    
    Catching mechanism are not present in Solidity. Usually you would do it on top of Solidity code.
    
    require will return remaining gas. assert consume all gas. assert used to validate invariants and build robust code. require used to validate user input.
    
    “automatic” asserts are triggered in unexpected cases (out of bound index, division by 0, byshifting by negative amount, .....)
    
    “automatic” requires are triggered in specific cases (your contract receives ether without payable modifier, your contract receives ether at a getter function, ....)
    
- Solidity structure
    
    polymorphism, you can inherit a contract or more like “ xContract is yContract, zContract, etc..”. using “super” you can access the base contract.
    
    a modifier change the behavior of a function, useful to validate condition centrally, like ownership.
    
    import files with contracts “import “filename””, “import * as symbolName from “filename””, “import {symbol1 as alias, symbol2} form “filename”” you can give alias to disambiguate.