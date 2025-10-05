const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Desplegando contratos con la cuenta:", deployer.address);

  const Token = await ethers.getContractFactory("DragonFlameToken");
  const token = await Token.deploy(1000);
  await token.waitForDeployment();
  console.log("Token desplegado en:", await token.getAddress());

  const NFT = await ethers.getContractFactory("DragonFlameNFT");
  const nft = await NFT.deploy();
  await nft.waitForDeployment();
  console.log("NFT desplegado en:", await nft.getAddress());

  const Crowdfunding = await ethers.getContractFactory("DragonFlameCrowdfunding");
  const crowdfunding = await Crowdfunding.deploy(
    await token.getAddress(),
    await nft.getAddress()
  );
  await crowdfunding.waitForDeployment();
  console.log("Crowdfunding desplegado en:", await crowdfunding.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
