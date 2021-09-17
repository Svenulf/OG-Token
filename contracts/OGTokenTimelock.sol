// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

contract OGTokenTimelock is TokenTimelock {

    address public constant _token = "token address"; // OG Token address
    uint256 public constant _lockedUpTime = 1 days; // Time added from now (Unix Epoch Time)
    address public constant _benefactor = 0x4B441a3680e85c375235435963052Aaf977f55BF; // current benefactor = magnusb.eth

    constructor () TokenTimelock(
        IERC20(_token),
        _benefactor,
        block.timestamp + _lockedUpTime) {
    }
}
