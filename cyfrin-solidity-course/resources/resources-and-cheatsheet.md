# 📚 Resources & Reference Materials

## Course Links

| Resource | URL |
|----------|-----|
| Cyfrin Updraft | https://updraft.cyfrin.io |
| Solidity Course | https://updraft.cyfrin.io/courses/solidity |
| Blockchain Basics | https://updraft.cyfrin.io/courses/blockchain-basics |
| Course GitHub Repo (official) | https://github.com/Cyfrin/foundry-full-course-cu |
| Cyfrin Discord | https://discord.gg/cyfrin |

## Tools

| Tool | URL |
|------|-----|
| Remix IDE | https://remix.ethereum.org |
| Foundry | https://getfoundry.sh |
| MetaMask | https://metamask.io |
| Etherscan (Sepolia) | https://sepolia.etherscan.io |
| Sepolia Faucet | https://sepoliafaucet.com |
| Chainlink Faucet | https://faucets.chain.link |

## Solidity & Web3 Docs

| Resource | URL |
|----------|-----|
| Solidity Docs | https://docs.soliditylang.org/en/v0.8.18 |
| Foundry Book | https://book.getfoundry.sh |
| Chainlink Docs | https://docs.chain.link |
| OpenZeppelin Contracts | https://docs.openzeppelin.com/contracts |
| EVM Codes (opcodes) | https://www.evm.codes |

---

## Solidity Quick Reference

### Pragma & License
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
```

### Types
```solidity
uint256  // 0 to 2^256-1
int256   // negative to positive
bool     // true / false
address  // 0x...20 bytes
bytes32  // fixed 32-byte array
string   // dynamic text (reference type)
```

### Memory Locations
```solidity
storage  // on-chain, permanent, expensive
memory   // temporary, modifiable, function scope
calldata // temporary, read-only, cheapest
```

### Sending ETH
```solidity
// Recommended
(bool ok,) = payable(recipient).call{value: amount}("");
require(ok, "Failed");
```

### Chainlink ETH/USD
```
Sepolia:  0x694AA1769357215DE4FAC081bf1f309aDC325306
Mainnet:  0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
```

---

## Foundry Commands

```bash
forge init                          # new project
forge build                         # compile
forge test                          # run tests
forge test -vvv                     # verbose
forge snapshot                      # gas snapshot
forge script script/Deploy.s.sol --broadcast  # deploy
cast balance <address>              # ETH balance
cast send <contract> "fn()" --private-key $PK  # call tx
```

---

## Gas Optimization Cheatsheet

| Technique | Saves Gas? |
|-----------|-----------|
| `immutable` instead of storage | ✅ Yes |
| `constant` for compile-time values | ✅ Yes |
| Custom errors vs `require` strings | ✅ Yes |
| Cache array length before loop | ✅ Yes |
| `calldata` vs `memory` for params | ✅ Yes |
| `uint256` vs smaller uints (outside struct) | ✅ Yes |
| Pack struct variables by size | ✅ Yes |
| Events instead of storage for history | ✅ Yes |
