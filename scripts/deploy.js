async function main () {
    const Token = await ethers.getContractFactory('OGToken');
    console.log('Deploying OG Token...');
    const token = await Token.deploy();
    await token.deployed();
    console.log('OG Token deployed to:', token.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });