// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

contract OGTokenTimelock is TokenTimelock {
/**
* Variable 1: TOKEN-ADDRESS should be the deployed OG-Token address
* Variable 2: Beneficiary is currently set to => magnusb.eth
* Variable 3: Release Time is a Unix Epoch Timestamp (https://www.epochconverter.com/) for the desired release date, currently set to GMT => Saturday 18 September 2021 12:00:00   
*/
    constructor () TokenTimelock(
        IERC20(TOKEN-ADDRESS), 
        0x4B441a3680e85c375235435963052Aaf977f55BF,
        1631966400) {
    }
}
