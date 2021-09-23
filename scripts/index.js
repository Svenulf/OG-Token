async function main () {

    const tokenAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
    const magnusb = '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266';

    // Retrieve accounts from the local node
    const accounts = await ethers.provider.listAccounts();
    console.log(accounts);

    const OGToken = await ethers.getContractFactory('OGToken');
    const OGtoken = await OGToken.attach(tokenAddress);

    // check decimals
    let decimals = await OGtoken.decimals();
    console.log("decimals:",decimals);

    // check cap
    let cap = await OGtoken.cap();
    console.log("cap:",cap.toString());

    // check tokens in circulation
    let tokensInSupply = await OGtoken.totalSupply();
    console.log("tokensInSupply:",tokensInSupply.toString());

    await OGtoken.mint(magnusb, 10);
    //await OGtoken.burn(99989699);

    let balanceOfMyAccount = await OGtoken.balanceOf(accounts[0]);
    console.log("balanceOfMyAccount:",balanceOfMyAccount.toString());
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });
