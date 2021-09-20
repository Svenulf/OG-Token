// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract OGToken is ERC20, ERC20Burnable, ERC20Snapshot, AccessControl, Pausable, ERC20Capped {
    bytes32 public constant SNAPSHOT_ROLE = keccak256("SNAPSHOT_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint8 private _decimals;

    constructor() ERC20("OG Token", "OGT") ERC20Capped(100000000) { // token name, symbol and cap
        _setupDecimals(6); // setup decimals for token
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(SNAPSHOT_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
        //_mint(msg.sender, 10000000 * 10 ** decimals()); // token amount minted at deployment
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function snapshot() public onlyRole(SNAPSHOT_ROLE) {
        _snapshot();
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function decimals() public view override returns (uint8) {
		return _decimals;
	}

    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }
    
    // Check if cap is reached before calling _mint function
    function _mint(address account, uint256 amount) internal virtual override(ERC20, ERC20Capped) {
        uint256 _amount = amount * 10 ** decimals(); // To mint whole tokens without the need to add all the decimal zeros  
        //require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded"); // test if needed
        super._mint(account, _amount);
    }
}
