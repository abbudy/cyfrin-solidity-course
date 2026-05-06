# Module 4 — AI Prompting for Developers (7 Lessons)

## Course: Cyfrin Updraft — Solidity Smart Contract Development
**Focus:** Using AI tools effectively as a smart contract developer

---

## Why AI Prompting Matters for Developers

AI tools like ChatGPT, Claude, and GitHub Copilot can:
- Explain Solidity concepts instantly
- Debug your contracts
- Suggest gas optimizations
- Write boilerplate code
- Explain error messages

But they can also **hallucinate** — give confidently wrong answers. You must know enough to verify the output.

---

## The Trifecta of Problem Solving

When stuck, use this order:
1. **Tinker** yourself first — try to understand the error
2. **Ask AI** (ChatGPT, Claude, Copilot)
3. **Search** (Google, Stack Overflow, Ethereum Stack Exchange)
4. **Ask in forums** (Cyfrin Discord, Reddit r/ethdev)

---

## Effective AI Prompting for Solidity

### Give Context
Bad prompt: *"Fix my code"*  
Good prompt: *"I'm writing a Solidity 0.8.18 FundMe contract. I get this error: `TypeError: Type address is not implicitly convertible to type address payable`. Here is my code: [paste code]. How do I fix this?"*

### Be Specific
```
"Explain what `immutable` does in Solidity and how it differs from `constant`.
Give an example of when to use each."
```

### Ask for Explanations, Not Just Answers
```
"Explain why the Checks-Effects-Interactions pattern prevents re-entrancy attacks.
Use a simple example with and without CEI."
```

### Verify AI Output
- Always compile and test AI-generated code
- Check if the Solidity version is correct
- Verify contract addresses (AI often invents addresses)
- Use Etherscan to verify on-chain facts

---

## Common Solidity Errors to Ask About

| Error | What to Ask AI |
|-------|---------------|
| `Stack too deep` | "How do I fix stack too deep error in Solidity?" |
| `Arithmetic overflow` | "What causes arithmetic overflow in Solidity 0.8?" |
| `Out of gas` | "How do I optimize gas in this Solidity loop?" |
| `Cannot read property of undefined` | "Ethers.js cannot read property — what does this mean?" |

---

## Useful AI Tools for Web3 Dev

| Tool | Best For |
|------|---------|
| [ChatGPT](https://chat.openai.com) | General Solidity Q&A, debugging |
| [Claude](https://claude.ai) | Code review, explanations |
| [GitHub Copilot](https://github.com/features/copilot) | In-editor code completion |
| [Phind](https://phind.com) | Technical search with code examples |

---

## Forum Resources (Human Help)

- [Cyfrin Discord](https://discord.gg/cyfrin) — official course support
- [Ethereum Stack Exchange](https://ethereum.stackexchange.com) — specific Q&A
- [r/ethdev](https://reddit.com/r/ethdev) — community discussion
- [GitHub Issues](https://github.com/Cyfrin/foundry-full-course-cu) — course repo issues

---

## Key Lesson: AI is a Tool, Not a Replacement

- AI can generate insecure smart contract code
- Always audit critical functions yourself
- Never deploy AI-generated code to mainnet without a full review
- The Cyfrin security courses teach you how to audit properly
