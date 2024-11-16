# PrimogemWish Contract

A Solidity smart contract that simulates Genshin Impact's wish system with pity mechanics, implementing require(), assert(), and revert() statements to ensure secure gacha mechanics.

## Description

The PrimogemWish contract simulates Genshin Impact's wish system with the following features:

1. **Wish System**: Simulates gacha pulls with authentic pity mechanics
2. **Pity Counter**: Tracks soft pity (75) and hard pity (90) for guaranteed 5-star drops
3. **50/50 System**: Implements the featured character guarantee system
4. **Primogem Management**: Handles primogem currency for wishes

## Safety Features

1. **require() statements**:
   - Validates primogem amounts
   - Checks wish count limits
   - Enforces wish cooldown periods

2. **assert() statements**:
   - Verifies primogem additions
   - Ensures pity counter never exceeds maximum
   - Validates internal state consistency

3. **revert() statements**:
   - Handles insufficient primogem scenarios
   - Manages failed wish attempts

## Getting Started

### Prerequisites

- Solidity ^0.8.18
- Remix IDE or any Ethereum development environment
- MetaMask or similar Ethereum wallet

### Executing Program

1. **Deploy the Contract**:
   - Deploy using Remix IDE to your chosen network

2. **Add Primogems**:
   ```solidity
   addPrimogems(1600);
   ```

3. **Make Wishes**:
   ```solidity
   wish(1);  // Single wish
   wish(10); // Ten pull
   ```

4. **Check Pity**:
   ```solidity
   getPityCount();
   ```

## Common Issues

1. **Wish Failed**:
   - Check if you have sufficient primogems (160 per wish)
   - Verify the cooldown period has passed
   - Ensure wish count is between 1 and 10

2. **Primogem Addition Failed**:
   - Amount must be positive
   - Cannot exceed 28,800 primogems per addition

## Features

- Authentic pity system matching Genshin Impact mechanics
- Soft pity increase at 75 wishes
- Guaranteed 5-star at 90 wishes
- 50/50 system for featured characters
- Wish history tracking
- Cooldown system between wishes

## License

This project is licensed under the MIT License