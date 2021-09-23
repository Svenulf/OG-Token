require('dotenv').config();
require('@nomiclabs/hardhat-ethers');
require('hardhat-deploy');
require("@nomiclabs/hardhat-etherscan");

const privateKey = process.env.ACCOUNT_KEY;
const rinkArbyKey = process.env.RINKARBY_KEY;
const etherscanKey = process.env.ETHERSCAN_KEY;

module.exports = {
  solidity: "0.8.2",
  networks: {
    rinkArby: {
      url: rinkArbyKey,
      accounts: [privateKey],
      gasPrice: 30000000
    }
  },
  etherscan: {
    apiKey: etherscanKey
  }
};
