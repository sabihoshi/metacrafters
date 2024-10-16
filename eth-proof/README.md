# HoyoCoin Contract

A Solidity smart contract that creates and manages a simple cryptocurrency, HoyoCoin (HYC). This contract allows minting new tokens, burning existing ones, and keeping track of balances for each address.

## Description

The HoyoCoin contract allows for the creation of a token with three key functionalities:
1. **Public Variables**: It stores public variables that provide the token's name, abbreviation, and the total supply of tokens.
2. **Balances Mapping**: A mapping of addresses to their respective token balances.
3. **Minting Tokens**: A function to mint new tokens, increasing the total supply and the balance of a given address.
4. **Burning Tokens**: A function to burn tokens, reducing the total supply and the balance of a given address, with conditions to prevent burning more tokens than the balance allows.

This contract is designed to be simple and clear for managing a basic token economy within a blockchain network.

## Getting Started

### Prerequisites

You will need the following to work with the HoyoCoin contract:
- Solidity ^0.8.18
- Remix IDE or any other Solidity development environment
- MetaMask or other Ethereum-compatible wallet for interaction

### Installing

1. Clone the repository or copy the contract code into your Solidity development environment (e.g., Remix IDE).
2. Ensure you are connected to a testnet or a local blockchain (such as Ganache).
3. Compile the contract using Solidity compiler version ^0.8.18.

### Executing program

1. **Deploy the Contract**:
    - After compiling the contract in Remix IDE, deploy it to the blockchain (e.g., using a local instance or a test network like Rinkeby).
2. **Minting Tokens**:
    - Call the `mint` function with the desired recipient address and amount to mint new tokens.
    ```sol
    mint("0xAddress", 100);
    ```
3. **Burning Tokens**:
    - Call the `burn` function with the address and amount to burn tokens from a balance.
    ```sol
    burn("0xAddress", 50);
    ```

## Help

### Common Issues:

1. **Insufficient Balance for Burn**:
   - Ensure that the address calling `burn` has a balance greater than or equal to the amount specified.

2. **Contract Compilation Errors**:
   - Ensure you're using the correct Solidity version (^0.8.18) and the appropriate blockchain development environment.

For more help, refer to Solidity documentation or [Remix IDE Help](https://remix-ide.readthedocs.io/).

## License

This project is licensed under the MIT License - see the [LICENSE.md](/LICENSE.md) file for details.
