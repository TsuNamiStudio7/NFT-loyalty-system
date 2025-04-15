# 🏆 NFT Loyalty System

An on-chain NFT-based loyalty program. Users earn points and redeem them for NFTs that act as badges or rewards.

---

## 🧰 Tech Stack

- Solidity (smart contract)
- OpenZeppelin (ERC721)
- Python + web3.py

---

## 📂 Files

- `LoyaltyNFT.sol` – smart contract logic
- `redeem_nft.py` – example script to redeem points for NFT
- `LoyaltyNFT_abi.json` – ABI of compiled contract

---

## 🧪 Usage

### 1. Deploy the contract

Use Remix or Hardhat to deploy `LoyaltyNFT.sol`. Save the ABI to `LoyaltyNFT_abi.json`.

### 2. Issue points (only owner)

```solidity
addPoints(address user, uint256 amount)
