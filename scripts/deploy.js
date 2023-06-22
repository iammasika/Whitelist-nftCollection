const hre= require("hardhat");

async function sleep (ms) {
  return new Promise((resolve) =>setTimeout(resolve, ms));
}

async function main () {
    //this is a factory instance of our Whitelist contract
    // deploying the contract
    const whitelistContract = await hre.ethers.deployContract("Whitelist", [10]);
    // 10 is the maximum number of whitelited addresses allowed

    // wait for the contract to deploy
    await whitelistContract.waitForDeployment();
    
    //printing the address of deployed contract
    console.log("Whitelist Contract Address:",whitelistContract.target);

    //sleeping for 30 sec for Etherscan indexes the new contract deployment
    await sleep(30*1000);

    //verifying the contract on etherscan
    await hre.run("verify:verify", {
      address: whitelistContract.target,
      constructorArguments: [10],
    });
}

//calling the main function and catching it incase of an error
main().then(() => process.exit(0)).catch((error) => {
  console.error(error);
  process.exit(1);
})
