# Module 1 — Simple Storage (16 Lessons)

## Course: Cyfrin Updraft — Solidity Smart Contract Development
**Instructor:** Patrick Collins  
**Project:** SimpleStorage Contract

---

## Key Concepts Learned

### What is a Smart Contract?
- Code deployed to a blockchain (EVM-compatible chain)
- Immutable once deployed — cannot be changed
- Decentralized — anyone can interact with it
- Deterministic — same inputs always = same output

### Setting Up Remix IDE
- Browser-based Solidity IDE at [remix.ethereum.org](https://remix.ethereum.org)
- No installation needed
- Compile → Deploy → Interact all in one place
- Connect MetaMask to deploy to testnets

---

## Solidity File Structure

```solidity
// SPDX-License-Identifier: MIT       ← always include license
pragma solidity ^0.8.18;              ← compiler version (^ = "this or higher minor")

contract SimpleStorage {
    // your code here
}
```

---

## Basic Types

| Type | Example | Notes |
|------|---------|-------|
| `uint256` | `uint256 x = 5;` | Unsigned, 256 bits |
| `int256` | `int256 y = -3;` | Signed |
| `bool` | `bool flag = true;` | true / false |
| `address` | `address owner;` | 20-byte ETH address |
| `bytes32` | `bytes32 data;` | Fixed bytes |
| `string` | `string name = "Ali";` | Dynamic text |

> **Default Values:** All uninitialized variables get their zero-value (`0`, `false`, `""`, `address(0)`)

---

## Functions

```solidity
// public: callable by anyone
// view: reads state, does NOT cost gas (when called externally)
// pure: no read OR write — totally isolated
// virtual: can be overridden by child contracts

function store(uint256 _num) public { myNum = _num; }
function retrieve() public view returns (uint256) { return myNum; }
```

### Function Visibility
| Keyword | Who Can Call |
|---------|-------------|
| `public` | Anyone |
| `private` | Only this contract |
| `internal` | This contract + children |
| `external` | Only from outside |

---

## Arrays

```solidity
uint256[] public dynamicArray;    // grows and shrinks
uint256[3] public fixedArray;     // always 3 elements

dynamicArray.push(7);             // add element
dynamicArray.length;              // number of elements
```

---

## Structs

```solidity
struct Person {
    uint256 favouriteNumber;
    string  name;
}

Person public pat = Person(7, "Patrick");
// OR named:
Person public pat = Person({favouriteNumber: 7, name: "Patrick"});
```

---

## Mappings

```solidity
mapping(string => uint256) public nameToFavouriteNumber;

nameToFavouriteNumber["Patrick"] = 7;
uint256 n = nameToFavouriteNumber["Patrick"]; // 7
```

- Default return is `0` for unknown keys
- Cannot iterate (no `.length`)

---

## Memory Locations (CRITICAL)

| Keyword | Where | Modifiable | Lifespan |
|---------|-------|-----------|---------|
| `storage` | Blockchain | ✅ | Permanent |
| `memory` | RAM | ✅ | Function only |
| `calldata` | Tx input | ❌ | Function only |

**Rule:** Strings, arrays, structs as function params → must declare `memory` or `calldata`

```solidity
// calldata is cheaper — use when you don't need to modify the param
function addPerson(string calldata _name, uint256 _num) public { ... }
```

---

## Deploying in Remix

1. Open Remix → New file → paste contract
2. **Compile:** Solidity compiler tab → `^0.8.18` → Compile
3. **Deploy:** Deploy & Run tab → select `Remix VM` → Deploy
4. **Interact:** Use the generated UI to call functions
5. Orange button = state-changing (costs gas) | Blue button = view/pure (free)
