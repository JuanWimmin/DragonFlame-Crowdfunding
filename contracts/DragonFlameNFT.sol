// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DragonFlameNFT
 * @dev NFT que representa recompensas únicas para los inversores tipo 2
 */
contract DragonFlameNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    constructor(address initialOwner)
        ERC721("DragonFlameNFT", "DFNFT")
        Ownable(initialOwner)
    {}

    function mintNFT(address recipient, string memory tokenURI)
        external
        onlyOwner
        returns (uint256)
    {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
