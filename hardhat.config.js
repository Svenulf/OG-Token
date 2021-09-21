 require('@nomiclabs/hardhat-ethers');
 require('hardhat-deploy');
 require("@nomiclabs/hardhat-etherscan");
 const secret = require("./secrets.json")

module.exports = {
  solidity: "0.8.2",
  networks: {
    rinkArby: {
      url: secret.url,
      accounts: [secret.accountPrivateKey],
      gasPrice: 30000000
    }
  },
};
