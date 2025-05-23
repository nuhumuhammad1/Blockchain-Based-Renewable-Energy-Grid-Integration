# Blockchain-Based Renewable Energy Grid Integration

This project implements a set of smart contracts for integrating renewable energy sources with the power grid using blockchain technology. The system enables verification of renewable energy generators, production forecasting, grid stability management, energy storage coordination, and market participation.

## Smart Contracts

The system consists of five main contracts:

1. **Generator Verification Contract** (`generator-verification.clar`)
    - Validates renewable energy sources
    - Manages generator registration and verification
    - Tracks generator capacity and type

2. **Production Forecasting Contract** (`production-forecasting.clar`)
    - Predicts generation patterns
    - Records forecasts with confidence levels
    - Considers weather conditions

3. **Grid Stability Contract** (`grid-stability.clar`)
    - Manages system balance
    - Monitors load and supply
    - Triggers stability actions when needed

4. **Storage Coordination Contract** (`storage-coordination.clar`)
    - Optimizes battery usage
    - Manages charging and discharging operations
    - Tracks storage unit status and efficiency

5. **Market Participation Contract** (`market-participation.clar`)
    - Enables energy trading
    - Manages offers and transactions
    - Records trade history

## Getting Started

### Prerequisites

- Clarity language support
- Stacks blockchain development environment

### Installation

1. Clone the repository
2. Deploy the contracts to the Stacks blockchain

## Usage

Each contract provides specific functionality for the renewable energy grid:

### Generator Verification

```clarity
;; Register a new generator
(contract-call? .generator-verification register-generator "Solar Farm Alpha" "solar" u1000 "Location A")

;; Verify a generator
(contract-call? .generator-verification verify-generator 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
