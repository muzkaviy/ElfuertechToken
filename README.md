# 🪙 Elfuertech Token (ELFT) & ICO Smart Contracts

This repository contains the smart contracts for **Elfuertech Token (ELFT)**, an ERC-20 compliant token, and its corresponding **Initial Coin Offering (ICO)** contract built on the Ethereum blockchain using Solidity.

## 🔧 Contracts Overview

### 1. `ElfuertechToken.sol`

A customizable ERC-20 token with the following features:

- ✅ ERC-20 Standard (based on OpenZeppelin)
- 🔒 Ownable — restrict sensitive functions to the owner
- 🧾 Minting — only authorized addresses (e.g., the ICO contract) can mint tokens
- 🔥 Burning — holders can burn (destroy) their own tokens
- ⚙️ Minter Management — owner can grant or revoke minting rights

### 2. `ElfuertechICO.sol`

A minimal ICO contract that handles the public sale of ELFT tokens:

- 💰 ETH to ELFT purchase at a fixed rate
- 🛡️ Purchase limits:
  - Global max token supply for sale (`maxTokensForSale`)
  - Per-address purchase cap (`maxPerAddress`)
- 📈 Emits events for each purchase
- 🔒 Owner-controlled:
  - Set sale rate
  - Adjust sale/purchase limits
- 🧾 Automatically mints tokens to the buyer
- 🔁 ETH is forwarded to the owner

---

## 📦 Installation & Deployment

### 1. Clone this repo

```bash
git clone https://github.com/your-username/elfuertech-token.git
cd elfuertech-token
