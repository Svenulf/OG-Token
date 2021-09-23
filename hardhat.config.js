require('dotenv').config();
require('@nomiclabs/hardhat-ethers');
require('hardhat-deploy');
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  solidity: "0.8.2",
  networks: {
    rinkArby: {
      url: process.env.RINKARBY_KEY,
      accounts: [process.env.ACCOUNT_KEY],
      gasPrice: 30000000
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_KEY
  }
};
