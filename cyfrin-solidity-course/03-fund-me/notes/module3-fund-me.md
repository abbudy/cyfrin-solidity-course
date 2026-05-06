# Module 3 — Fund Me (29 Lessons)

## Course: Cyfrin Updraft — Solidity Smart Contract Development
**Project:** FundMe DApp — the biggest project in the course!

---

## Key Concepts Learned

### Sending ETH to a Contract

```solidity
// Function must be marked `payable` to accept ETH
function fund() public payable {
    require(msg.value >= 1e18, "Need at least 1 ETH");
}
```

`msg.value` = wei sent. `1 ether == 1e18 wei`

---

## Blockchain Oracles (Chainlink)

**Problem:** Smart contracts cannot access off-chain data (like ETH price)  
**Solution:** Chainlink oracles bring external data on-chain in a decentralized way

```solidity
// AggregatorV3Interface — Chainlink's price feed interface
AggregatorV3Interface priceFeed = AggregatorV3Interface(
    0x694AA1769357215DE4FAC081bf1f309aDC325306  // Sepolia ETH/USD
);
(, int256 price, , , ) = priceFeed.latestRoundData();
// price = 200000000000 → $2000 with 8 decimals
```

---

## Solidity Libraries

```solidity
library PriceConverter {
    // All functions must be internal
    function getPrice(AggregatorV3Interface feed) internal view returns (uint256) { ... }
    function getConversionRate(uint256 weiAmount, AggregatorV3Interface feed)
        internal view returns (uint256) { ... }
}

// Attach library to a type
using PriceConverter for uint256;

// Now call as method on uint256:
msg.value.getConversionRate(priceFeed);
// equivalent to: PriceConverter.getConversionRate(msg.value, priceFeed)
```

---

## Custom Errors (v0.8+)

```solidity
// Gas-efficient alternative to require strings
error FundMe__NotOwner();
error FundMe__NotEnoughEth();

// Usage:
if (msg.sender != owner) revert FundMe__NotOwner();
```

Why? Storing error strings costs gas. Custom errors are just function selectors (4 bytes).

---

## Constants & Immutables

```solidity
// constant — known at compile time, CAPS by convention
uint256 public constant MINIMUM_USD = 5e18;

// immutable — set once in constructor, cheaper than storage reads
address public immutable i_owner;

constructor() {
    i_owner = msg.sender;
}
```

| Keyword | Set When | Gas Cost |
|---------|----------|----------|
| regular variable | Anytime | Storage read = expensive |
| `constant` | Compile time | Inline = very cheap |
| `immutable` | Constructor | Inline = very cheap |

---

## Modifiers

```solidity
modifier onlyOwner() {
    if (msg.sender != i_owner) revert FundMe__NotOwner();
    _;  // rest of the function executes here
}

function withdraw() public onlyOwner { ... }
```

---

## Receive & Fallback

```solidity
// If ETH sent with empty calldata → receive()
receive() external payable { fund(); }

// If ETH sent with data OR receive() doesn't exist → fallback()
fallback() external payable { fund(); }
```

This means anyone sending ETH directly (not calling `fund()`) still gets counted!

---

## Chainlink Price Feed Addresses

| Network | Feed | Address |
|---------|------|---------|
| Sepolia | ETH/USD | `0x694AA1769357215DE4FAC081bf1f309aDC325306` |
| Mainnet | ETH/USD | `0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419` |

Find all feeds at: [data.chain.link](https://data.chain.link)

---

## Gas Optimization Pattern

```solidity
// BAD — reads from storage on every iteration (expensive)
for (uint256 i = 0; i < s_funders.length; i++) { ... }

// GOOD — cache in memory first
uint256 fundersLength = s_funders.length;
for (uint256 i = 0; i < fundersLength; i++) { ... }
```

**Naming convention for gas clarity:**
- `s_` prefix → storage variable (expensive)
- `i_` prefix → immutable (cheap)
- No prefix → local/memory (cheap)

---

## Checks-Effects-Interactions (CEI)

```solidity
function withdraw() public onlyOwner {
    // CHECKS (already done via modifier)

    // EFFECTS — update state first
    s_funders = new address[](0);
    for (...) { s_addressToAmountFunded[funder] = 0; }

    // INTERACTIONS — external call last
    (bool success,) = payable(i_owner).call{value: address(this).balance}("");
    if (!success) revert FundMe__WithdrawFailed();
}
```
