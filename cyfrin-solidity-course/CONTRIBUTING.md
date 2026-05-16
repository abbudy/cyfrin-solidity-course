# 🤝 Contributing Guide

This is a collaborative group repository for the Cyfrin Updraft Solidity Smart Contract Development course assignment.

---

## Step-by-Step Git Workflow for Each Member

### 1. Clone the Repo
```bash
git clone https://github.com/abbudy/cyfrin-solidity-course.git
cd cyfrin-solidity-course
```

### 2. Create Your Branch
```bash
git checkout -b feat/your-name-module1
```

### 3. Make Your Contributions
- Add or improve contracts in the relevant module folder
- Add your notes
- Add screenshots of your own progress to `/screenshots`

### 4. Commit with a Meaningful Message
```bash
git add .
git commit -m "feat: add FundMe tests by [Your Name]"
git push origin feat/your-name-module1
```

### 5. Open a Pull Request on GitHub
- Go to the repo on GitHub
- Click **"New Pull Request"**
- Set base branch to `main`, compare to your feature branch
- Add a description of what you contributed
- Request a review from a teammate

---

## Commit Message Format

```
<type>: <short description> by <your name>
```

Types:
- `feat` — new contract or feature
- `docs` — notes or README update
- `fix` — bug fix in a contract
- `test` — adding or fixing tests
- `refactor` — code restructuring
- `chore` — repo maintenance

### Examples
```
feat: add SimpleStorage struct mapping by Abdu
docs: add Module 3 Chainlink oracle notes by Sara
test: add FundMe withdraw edge case tests by Ali
fix: fix CEI ordering in FundMe withdraw by Abdu
```

---

## Folder Conventions

| Folder | What Goes In |
|--------|-------------|
| `contracts/` | `.sol` files |
| `tests/` | `.t.sol` Foundry test files |
| `notes/` | `.md` lesson notes |
| `certificates/` | Completion certificate images |
| `screenshots/` | Progress screenshots from Updraft |
| `resources/` | Cheatsheets, references |

---

## Code Standards

- Always include `// SPDX-License-Identifier: MIT`
- Always pin `pragma solidity ^0.8.18;`
- Add NatSpec comments: `@title`, `@notice`, `@dev`, `@param`, `@return`
- Follow CEI pattern for any ETH-transfer functions
- Emit events for all state changes
- Use custom errors instead of `require` strings

---

## Team Members

## 👥 Contributors

| Name | GitHub | Contributions |ID|
|------|--------|---------------|
| Abdu Ahmed Mohammed | [@abbudy](https://github.com/abbudy) | UGR/30024/15, All modules, contracts, notes |
| Abdurahman Aliyi |learn-solidity-alchemy-master/screnshoots/completed certificate.jpg | UGR/30040/15 |
| Faysel Abdella   | | UGR/25435/14 |
| Esmail Shikur    |learn-solidity-alchemy-master/screnshoots/finish.png | UGR/30480/15 |
| Fasil Hawultie   | learn-solidity-alchemy-master/screnshoots/Fasil Hawultie Completed.jpg| UGR/25578/14|


---
