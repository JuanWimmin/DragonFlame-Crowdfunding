// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IToken {
    function transfer(address to, uint256 amount) external returns (bool);
}

interface INFT {
    function mintNFT(address recipient, string memory tokenURI) external returns (uint256);
}

/**
 * @title DragonFlameCrowdfunding
 * @dev Sistema de crowdfunding con distribución de tokens y NFTs
 */
contract DragonFlameCrowdfunding is Ownable, ReentrancyGuard {
    IToken public token;
    INFT public nft;

    uint256 public constant TYPE1_TOKENS = 1;
    uint256 public constant TYPE2_TOKENS = 1;
    uint256 public constant MAX_INVESTORS = 1000;

    struct Investor {
        uint8 investorType;
        bool hasInvested;
        uint256 tokensReceived;
        uint256 nftId;
    }

    mapping(address => Investor) public investors;
    address[] public investorList;

    bool public isActive = true;

    event InvestorRegistered(address indexed investor, uint8 investorType);
    event TokensDistributed(address indexed investor, uint256 amount);
    event NFTMinted(address indexed investor, uint256 nftId);
    event CrowdfundingEnded();

    modifier onlyActive() {
        require(isActive, "Crowdfunding is not active");
        _;
    }

    constructor(address _token, address _nft, address initialOwner)
        Ownable(initialOwner)
    {
        token = IToken(_token);
        nft = INFT(_nft);
    }

    function registerInvestorType1() external nonReentrant onlyActive {
        require(!investors[msg.sender].hasInvested, "Already invested");
        require(investorList.length < MAX_INVESTORS, "Max investors reached");

        investors[msg.sender] = Investor(1, true, 0, 0);
        investorList.push(msg.sender);

        emit InvestorRegistered(msg.sender, 1);
        _distributeTokens(msg.sender);
    }

    function registerInvestorType2() external nonReentrant onlyActive {
        require(!investors[msg.sender].hasInvested, "Already invested");
        require(investorList.length < MAX_INVESTORS, "Max investors reached");

        investors[msg.sender] = Investor(2, true, 0, 0);
        investorList.push(msg.sender);

        emit InvestorRegistered(msg.sender, 2);
        _distributeTokensAndNFT(msg.sender);
    }

    function _distributeTokens(address investor) internal {
        uint256 amount = investors[investor].investorType == 1
            ? TYPE1_TOKENS
            : TYPE2_TOKENS;

        require(token.transfer(investor, amount), "Token transfer failed");
        investors[investor].tokensReceived = amount;
        emit TokensDistributed(investor, amount);
    }

    function _distributeTokensAndNFT(address investor) internal {
        _distributeTokens(investor);
        uint256 nftId = nft.mintNFT(investor, "");
        investors[investor].nftId = nftId;
        emit NFTMinted(investor, nftId);
    }

    function endCrowdfunding() external onlyOwner {
        isActive = false;
        emit CrowdfundingEnded();
    }

    function getInvestorCount() external view returns (uint256) {
        return investorList.length;
    }
}
