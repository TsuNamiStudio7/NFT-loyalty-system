from web3 import Web3
import json

w3 = Web3(Web3.HTTPProvider("http://localhost:8545"))
contract_address = "0xYourContractAddressHere"
account = w3.eth.accounts[0]

with open("LoyaltyNFT_abi.json") as f:
    abi = json.load(f)

contract = w3.eth.contract(address=contract_address, abi=abi)

def redeem(points_required, token_uri):
    tx = contract.functions.redeem(points_required, token_uri).build_transaction({
        "from": account,
        "nonce": w3.eth.get_transaction_count(account),
        "gas": 300000,
        "gasPrice": w3.to_wei("20", "gwei")
    })
    signed_tx = w3.eth.account.sign_transaction(tx, private_key="0xYourPrivateKeyHere")
    tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)
    print(f"NFT Redeemed! Tx Hash: {tx_hash.hex()}")
