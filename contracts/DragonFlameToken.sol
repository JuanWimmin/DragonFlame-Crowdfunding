// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DragonFlameToken
 * @dev Token ERC20 indivisible usado en el sistema de crowdfunding
 */
contract DragonFlameToken is ERC20, Ownable {
    constructor(uint256 initialSupply, address initialOwner)
        ERC20("DragonFlameToken", "DFT")
        Ownable(initialOwner)
    {
        _mint(initialOwner, initialSupply);
    }

    function decimals() public pure override returns (uint8) {
        return 0; // Token indivisible
    }
}
