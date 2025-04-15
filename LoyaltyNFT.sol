// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LoyaltyNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    mapping(address => uint256) public points;

    constructor() ERC721("LoyaltyBadge", "LBADGE") {}

    function addPoints(address user, uint256 amount) external onlyOwner {
        points[user] += amount;
    }

    function redeem(uint256 requiredPoints, string memory tokenURI) external {
        require(points[msg.sender] >= requiredPoints, "Not enough points");
        points[msg.sender] -= requiredPoints;

        _safeMint(msg.sender, nextTokenId);
        _setTokenURI(nextTokenId, tokenURI);
        nextTokenId++;
    }

    function getPoints(address user) external view returns (uint256) {
        return points[user];
    }
}
