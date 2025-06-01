// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./ElfuertechToken.sol";

contract ElfuertechICO {
    ElfuertechToken public token;
    address payable public owner;
    uint256 public rate = 100; // 1 ETH = 100 ELFT
    
    uint256 public maxTokensForSale = 100_000 * 10 ** 18;
    uint256 public totalTokensSold;
    uint256 public maxPerAddress = 2_000 * 10 ** 18;

    mapping(address => uint256) public tokensPurchased;

    event TokensPurchased(address indexed buyer, uint256 amountETH, uint256 tokens);

    constructor(address tokenAddress) {
        token = ElfuertechToken(tokenAddress);
        owner = payable(msg.sender);
    }

    receive() external payable {
        buyTokens();
    }

    function buyTokens() public payable {
        require(msg.value > 0, "ETH required");

        uint256 tokenAmount = msg.value * rate;

        require(totalTokensSold + tokenAmount <= maxTokensForSale, "Exceeds ICO token limit");
        
        require(tokensPurchased[msg.sender] + tokenAmount <= maxPerAddress, "Exceeds per-address limit");

        token.mint(msg.sender, tokenAmount);

        tokensPurchased[msg.sender] += tokenAmount;
        
        totalTokensSold += tokenAmount;

        emit TokensPurchased(msg.sender, msg.value, tokenAmount);

        owner.transfer(msg.value);
    }

    function setRate(uint256 newRate) external {
        require(msg.sender == owner, "Only owner");
        rate = newRate;
    }
    
    function setMaxTokensForSale(uint256 newLimit) external {
        require(msg.sender == owner, "Only owner");
        maxTokensForSale = newLimit;
    }

    function setMaxPerAddress(uint256 newLimit) external {
        require(msg.sender == owner, "Only owner");
        maxPerAddress = newLimit;
    }
}
