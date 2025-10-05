// scripts/verify.js
const hre = require("hardhat");

async function main() {
  // Fill these addresses after deploying
  const tokenAddress = "0xTOKEN_ADDRESS";
  const nftAddress = "0xNFT_ADDRESS";
  const crowdfundingAddress = "0xCROWDFUNDING_ADDRESS";

  try {
    await hre.run("verify:verify", {
      address: tokenAddress,
      constructorArguments: [1000],
    });
  } catch (err) { console.warn("Token verify:", err.message || err); }

  try {
    await hre.run("verify:verify", {
      address: nftAddress,
      constructorArguments: [],
    });
  } catch (err) { console.warn("NFT verify:", err.message || err); }

  try {
    await hre.run("verify:verify", {
      address: crowdfundingAddress,
      constructorArguments: [tokenAddress, nftAddress],
    });
  } catch (err) { console.warn("Crowdfunding verify:", err.message || err); }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
