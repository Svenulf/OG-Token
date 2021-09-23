// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

/** 
*   @title Origin Group Token
*   @author Magnus Bostedt
*   @notice This contract is a standard tradable token with the following functions: burnable, snapshop, access control, capped, and pausable.
*   @dev This is a token contract with inherited openZeppelin standard ERC20 contracts. We have followed general OpenZeppelin Contracts guidelines.
*   The token has the following functions: burnable, snapshop, access control, capped, and pausable, all inherited from openZeppelin library.
*/
contract OGToken is ERC20, ERC20Burnable, ERC20Snapshot, AccessControl, Pausable, ERC20Capped {
    bytes32 public constant SNAPSHOT_ROLE = keccak256("SNAPSHOT_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint8 private _decimals;

    /**
    *   @dev The constructor sets the following token variables: cap, roles and decimals. From the openZeppelin Wizard with the addition of setting 
    *   the capped total supply of tokens and setup of the token decimals  
    */ 
    constructor() ERC20("OG Token", "OGT") ERC20Capped(100000000000000) {
        _setupDecimals(6);
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(SNAPSHOT_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }

    /**
    *   @dev From the openZeppelin Wizard. Access control check for the internal snapshot function
    */
    function snapshot() public onlyRole(SNAPSHOT_ROLE) {
        _snapshot();
    }

    /**
    *   @dev From the openZeppelin Wizard. Access control check for the internal pause function
    */
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    /**
    *   @dev From the openZeppelin Wizard. Access control check for the internal unpause function
    */
    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    /**
    *   @dev From the openZeppelin Wizard. Mint function to set the mint variables (to and amount) and access control check for the internal mint function 
    */
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    /**
    *   @dev Override of _beforeTokenTransfer from the openZeppelin Wizard  
    */
    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    /**
    *   @dev ERC20 decimals view function override. Returns the _decimals variable
    */
    function decimals() public view override returns (uint8) {
		return _decimals;
	}

    /**
    *   @dev A function used only once when setting up the token decimals in constructor
    */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
    *   @dev Override of the internal _mint function from ERC20 and ERC20Capped. Calls the super function from ERC20Capped to check 
    *   if capped amount of tokens is reached, which if passed calls the super function in ERC20 to run the minting function 
    */ 
    function _mint(address account, uint256 amount) internal virtual override(ERC20, ERC20Capped) {
        super._mint(account, amount);
    }
}
