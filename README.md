## Be A Good Gamer ChatApp

##### This app is intended to utilize smart contracts to start and manage chat topics using an eventual token to incentivize civilized discourse in the gaming community.

First run ganache

`instructions coming soon`

We are going to install dependencies, and then compile the contract, run a test, and then deploy for frontend work.

```bash
this app will run on truffle
truffle compile
truffle migrate
```

After `truffle migrate` you should see something similar to:

```bash
Using network 'development'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0xcc1a5aea7c0a8257ba3ae366b83af2d257d73a5772e84393b0576065bf24aedf
  Migrations: 0x8cdaf0cd259887258bc13a92c0a6da92698644c0
Saving successful migration to network...
  ... 0xd7bc86d31bee32fa3988f1c1eabce403a1b5d570340a3a9cdba53a472ee8c956
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying Chat...
  ... 0x43b6a6888c90c38568d4f9ea494b9e2a22f55e506a8197938fb1bb6e5eaa5d34
  Chat: 0x345ca3e014aaf5dca488057592ee47305d9b3e10
Saving successful migration to network...
  ... 0xf36163615f41ef7ed8f4a8f192149a0bf633fe1a2398ce001bf44c43dc7bdda0
Saving artifacts...
```

## Structure

Find the contract in `contracts/Chat`

FInd the test in `test/Chat.test.js`

## Will most likely be built with

- [Web3.js](https://github.com/ethereum/web3.js) - Ethereum JavaScript API
- [Solidity](https://github.com/ethereum/solidity) - Language for Ethereum Smart Contracts
- [Infura](https://github.com/ethereum/solidity) - Ethereum Client Provider
- [Rinkeby](https://www.rinkeby.io/#stats) - Ethereum Test Network
- [MetaMask](https://metamask.io/) - Chrome extension for access to Ethereum and TestRPCs
- [Solidity for VSCode](https://github.com/juanfranblanco/vscode-solidity) - VSCode add on for syntax highlighting and in editor compiling.

## Authors

- **Phillip Lorenzo**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
