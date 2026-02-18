# Stacks DAO

A decentralized autonomous organization (DAO) implementation on the Stacks blockchain, built with Clarity.

## Contracts

This project includes the following Clarity contracts:

- **`dao-core.clar`**: The core logic for the DAO, managing proposals and voting mechanisms.
- **`governance-token.clar`**: A SIP-010 compliant fungible token used for governance and voting power.
- **`treasury.clar`**: Manages the funds and assets of the DAO.
- **`executor-trait.clar`**: A trait definition for proposal executors.
- **`sip-010-trait.clar`**: The standard trait definition for SIP-010 fungible tokens.

## Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet)
- [Node.js](https://nodejs.org/) & NPM

## Setup

1. Install dependencies:
   ```bash
   npm install
   ```

## Development

### Check Contracts

To check the validity of the Clarity contracts:

```bash
clarinet check
```

### Run Tests

This project uses Vitest for testing.

To run the test suite:

```bash
npm run test
```

To run tests with coverage and cost reports:

```bash
npm run test:report
```

To run tests in watch mode:

```bash
npm run test:watch
```

## Project Structure

- `contracts/`: Contains the Clarity smart contracts.
- `tests/`: Contains the test suite files.
- `settings/`: Configuration settings.
- `Clarinet.toml`: Project configuration for Clarinet.
