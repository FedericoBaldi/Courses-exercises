# Blockchain ETH Developement Solidity notes

From course Ethereum Blockchain Developer Bootcamp With Solidity (2022), Ravinder Deol, Thomas Wiesner

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

BlockChain is like google Docs, it is like a shared document. You dont need to lock access to the ledger of a bank when you are modifying it.

MetaMask extension as a wallet to receive and send ETH

MetaMask is connected to Infura - Blockchain as a service provider. They have internal nodes running in the background. They open a restful API to interact with the Blockchain via a node they are hosting.

How can the Blockchain know to send a transaction? Through signatures.

- after we send a transaction (function) we will get 3 parameters. V,R,S
    
    ![IMG_20211129_230845.jpg](Blockchain%20ETH%20notes%20794cfaa28847490088530f79390c4b10/IMG_20211129_230845.jpg)
    
- Hash in short
    
    There are a lot of hash functions, an ideal hash function is:
    
    1. it is deterministic, same input = same output.
    2. it is quick to compute.
    3. it is not possible to generate a message from its hash value except by brute force.
    4. it is uncorrelated, a small change to a message, completely change the output.
    5. it is not possible to find two messages with the same hash value.

A block in the Blockchain have hashes of the previous block which has hashes of the previous block and so on. That's why it is secure, because the blocks are chained together.

Solidity: is an object-oriented, high-level language for implementing smart contracts

- Smart Contract
    
    A piece of code running on the blockchain
    
    - it's a state machine
    - needs transactions to change state
    - can do logic operations
    - they are turing complete

Multiple programming languages for smart contracts: Solidity, Vyper, Serpent, LLL → once code is compiled, they produce EVM bytecode that can run on the blockchain.

Every Ethereum node in the network executes the same code, because every node has a copy of the chain.

- [Remix](https://remix.ethereum.org/) online geditor and compiler
    
    Used to write, compile and Deploy Smart Contracts
    
    - to deploy Smart Contracts you can use 3 different options:
        
        JavaScript VM - on web testing environment provided by Remix → fast, easy, but not 100% under control and editable.
        
        Injected Web 3 - by MetaMask use real Ethereum BlockChain or testing public BlockChains → close to real-world scenario, but slow
        
        Web3 Provider - by using [Ganache](https://trufflesuite.com/ganache), you can have a local BlockChain and debug on it. → fast, medium complicated, more flexible and editable.
        
- BlockChain Nodes
    
    There are different implementations of an Ethereum Node with different programming language. What matter is that they all use the Ethereum Protocol to talk with each other.
    
    - You can have create a private Ethereum Network with private Nodes.
        
        a company, a bank can create their own Eth network and have their own data.
        
        it is possible to branch from the main network and start with a the data state of the main network and from there on continue with private network data.
        
        however you start, you start with a Genesis Block, first block written to the network. It comes from a Genesis file, it is the configuration for the Genesis Block, every other blocks are built upon the first one. It is the only thing you need to configure if you want to start your own network.
        
- Solidity
    - Resources in the resources folder
    - Variables
        
        all variables get initialized with their default → int 0, strin g empty,...
        
        any value/balance you will have, it will be in $wei = 10^{-18}Eth$
        
        Public variables generate a getter function automatically.
        
        Keep in mind you have very limited resources. Gas fees are expensive
        
        - Types
            - bool classic bolleans.
            - uintX or intX where X is 8,16,32,64,128,256. uint by default is 256.
            - fixed point not implemented yet. Good practice → uint numTokens = 10000 uint decimalPoints = 2. Use 2 variables to handle floats, doubles.
            - address, every interaction is address base. Used to transfer ether from smart contracts to addresses or other smart contracts. They already have a lot of built-in functions (transfer, send, call.value, delegatecall, ecc)
            - string are internally stored as byte arrays, they are then convert in utf when you need them. you cannot do a lot of stuff, like concatenate, search, replace, ecc. They are expensive, gas fee wise.
        
        Every time you have a string or any other reference type, you have to specify where you store it. “memory” = this variable will be stored in the memory and not in a storage variable.(of course cheaper). The alternative is “storage”.
