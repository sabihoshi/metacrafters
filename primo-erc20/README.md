# Token Contract

A simple token contract for **Primogem (PRIMO)**, with minting, burning, and transferring functions.

## Description

This contract creates a basic token called **Primogem (PRIMO)**. It tracks token balances, allows the contract owner to mint new tokens to an address, and enables any user to burn tokens from their own account or transfer tokens to another address. The total supply adjusts as tokens are minted or burned.

## Getting Started

### Installing

- Use Remix IDE or any Solidity-supported IDE to deploy the contract.

### Executing Program

1. Compile and deploy the contract in Remix.
2. Mint tokens (only the owner can perform this):
   ```solidity
   mint("address", amount);
   ```
3. Burn tokens (any user can burn from their own balance):
   ```solidity
   burn(amount);
   ```
4. Transfer tokens (any user can transfer to another address):
   ```solidity
   transfer("recipient_address", amount);
   ```

## Help

Check Remix IDE for errors or insufficient gas issues.

## License

This project is licensed under the MIT License.