// scripts/upload-metadata.js
const axios = require("axios");
require("dotenv").config();

const PINATA_BASE_URL = "https://api.pinata.cloud/pinning/pinJSONToIPFS";
const { PINATA_API_KEY, PINATA_SECRET_KEY } = process.env;

async function uploadMetadata(name, description, imageUrl) {
  const metadata = {
    name,
    description,
    image: imageUrl,
  };

  try {
    const res = await axios.post(PINATA_BASE_URL, metadata, {
      headers: {
        pinata_api_key: PINATA_API_KEY,
        pinata_secret_api_key: PINATA_SECRET_KEY,
        "Content-Type": "application/json",
      },
    });
    console.log("Pinata response:", res.data);
    return res.data.IpfsHash;
  } catch (err) {
    console.error("Pinata error:", err.response ? err.response.data : err.message);
    throw err;
  }
}

// Example usage
(async () => {
  const ipfsHash = await uploadMetadata(
    "DragonFlame Founder Badge",
    "NFT reward for Type 2 investors in DragonFlame Crowdfunding",
    "ipfs://<your_image_hash_here>"
  );
  console.log("Uploaded metadata IPFS hash:", ipfsHash);
})();
