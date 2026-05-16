# 🎓 Cyfrin Updraft — Solidity Smart Contract Development

![Cyfrin Updraft](https://img.shields.io/badge/Cyfrin%20Updraft-Solidity%20101-orange?style=for-the-badge)
![Solidity](https://img.shields.io/badge/Solidity-^0.8.18-363636?style=for-the-badge&logo=solidity)
![Status](https://img.shields.io/badge/Course-Completed%20✅-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

> **Course:** [Solidity Smart Contract Development — Cyfrin Updraft](https://updraft.cyfrin.io/courses/solidity)  
> **Instructor:** Patrick Collins (Founder at Cyfrin) & Austin Griffith  
> **Level:** Beginner  
> **Duration:** 5 hours | 62 Lessons | 3 Projects  
> **Student:** Abdu Ahmed Mohammed  
> **Completed:** March 13, 2025

---

## 👥 Contributors

| Name | GitHub | Contributions |
|------|--------|---------------|
| Abdu Ahmed Mohammed | [@abbudy](https://github.com/abbudy) | All modules, contracts, notes |
| Abdurahman Aliyi |learn-solidity-alchemy-master/screnshoots/completed certificate.jpg | UGR/30040/15 |
| Faysel Abdella   | | UGR/25435/14 |
| Esmail Shikur    |learn-solidity-alchemy-master/screnshoots/finish.png | UGR/30480/15 |
| Fasil Hawultie   | learn-solidity-alchemy-master/screnshoots/Fasil Hawultie Completed.jpg| UGR/25578/14|


---

## 🏆 Certificates of Completion

| Certificate | Platform | Status |
|-------------|----------|--------|
| [Solidity Smart Contract Development](./certificates/solidity-smart-contract-development-certificate.png) | Cyfrin Updraft | ✅ Completed |
| [Blockchain Basics Course](./certificates/blockchain-basics-certificate.png) | Cyfrin Updraft | ✅ Completed |

---

## 📋 Table of Contents

- [About the Course](#about-the-course)
- [Repository Structure](#repository-structure)
- [Course Modules & Projects](#course-modules--projects)
- [Contracts Built](#contracts-built)
- [How to Run the Code](#how-to-run-the-code)
- [Resources](#resources)
- [Contributors](#contributors)

---

## 📖 About the Course

This repository contains all codebases, notes, and resources completed as part of the **Cyfrin Updraft — Solidity Smart Contract Development** course. The course covers:

- ✅ Solidity variable types, functions, arrays, structs, and mappings
- ✅ Memory, calldata, storage locations
- ✅ Inheritance and contract ABIs
- ✅ Sending ETH through functions and contracts
- ✅ Blockchain oracles (Chainlink)
- ✅ Importing libraries from NPM and GitHub
- ✅ Constructors, modifiers, immutability, and constants
- ✅ Solidity SafeMath and custom errors
- ✅ Gas optimization techniques
- ✅ AI-assisted development workflow

---

## 🗂️ Repository Structure

```
cyfrin-solidity-course/
│
├── 01-simple-storage/
│   ├── notes/                    # Lesson notes & concepts
│   ├── contracts/                # SimpleStorage.sol
│   └── tests/                    # Foundry tests
│
├── 02-storage-factory/
│   ├── notes/
│   ├── contracts/                # StorageFactory.sol, SimpleStorage.sol
│   └── tests/
│
├── 03-fund-me/
│   ├── notes/
│   ├── contracts/                # FundMe.sol, PriceConverter.sol
│   └── tests/
│
├── 04-ai-prompting/
│   └── notes/                    # AI prompting techniques for devs
│
├── certificates/                 # Course completion certificates ✅
├── screenshots/                  # Progress screenshots
├── resources/                    # Cheatsheets & reference material
├── CONTRIBUTING.md
└── README.md
```

---

## 📚 Course Modules & Projects

| # | Module | Lessons | Project | Status |
|---|--------|---------|---------|--------|
| 1 | **Simple Storage** | 16 lessons | SimpleStorage contract | ✅ Done |
| 2 | **Storage Factory** | 10 lessons | Factory pattern + interactions | ✅ Done |
| 3 | **Fund Me** | 29 lessons | FundMe DApp with Chainlink | ✅ Done |
| 4 | **AI Prompting** | 7 lessons | AI-assisted dev workflow | ✅ Done |

---

## 🔨 Contracts Built

| Contract | Module | Description |
|----------|--------|-------------|
| `SimpleStorage.sol` | 01 | Store & retrieve a favourite number, struct list of people |
| `StorageFactory.sol` | 02 | Deploy & interact with multiple SimpleStorage instances |
| `AddFiveStorage.sol` | 02 | Inherits SimpleStorage, overrides store function |
| `FundMe.sol` | 03 | Accept ETH funding with minimum USD threshold via Chainlink |
| `PriceConverter.sol` | 03 | Solidity library — converts ETH to USD using Chainlink oracle |

---

## ⚙️ How to Run the Code

### Prerequisites
- [Git](https://git-scm.com/)
- [Foundry](https://getfoundry.sh/)

### Clone & Setup
```bash
git clone https://github.com/abbudy/cyfrin-solidity-course.git
cd cyfrin-solidity-course
```

### Compile
```bash
forge build
```

### Run Tests
```bash
forge test
forge test -vvv   # verbose
```

### Deploy to Sepolia Testnet
```bash
forge script script/DeployFundMe.s.sol \
  --rpc-url $SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify
```

### Use Remix IDE (No Install)
1. Go to [remix.ethereum.org](https://remix.ethereum.org)
2. Create a new file and paste any `.sol` contract
3. Compile with Solidity `^0.8.18`
4. Deploy to Remix VM (injected provider)

---

## 📦 Resources

See [`/resources`](./resources/) for:
- Solidity cheatsheet
- Foundry commands reference
- Chainlink documentation links
- Gas optimization tips

---



## 📜 License

MIT License — feel free to use this as a reference for your own learning.

---

> *Completed with ❤️ via [Cyfrin Updraft](https://updraft.cyfrin.io) — the #1 free web3 education platform*
