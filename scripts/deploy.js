
const { ethers } = require("hardhat");
const fs = require("fs");
const path = require("path");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with account:", deployer.address);

  const bal = await ethers.provider.getBalance(deployer.address);
  console.log("Deployer balance:", ethers.utils.formatEther(bal), "ETH");

  const SkillCert = await ethers.getContractFactory("SkillCert");
  const contract = await SkillCert.deploy();
  await contract.deployed();

  console.log("SkillCert deployed to:", contract.address);

  
  const webDir = path.join(__dirname, "..", "web");
  if (!fs.existsSync(webDir)) fs.mkdirSync(webDir, { recursive: true });
  const cfg = `window.SKILLCERT_CONFIG = { address: "${contract.address}" };`;
  fs.writeFileSync(path.join(webDir, "config.js"), cfg);

 
  const artifactPath = path.join(__dirname, "..", "artifacts", "contracts", "SkillCert.sol", "SkillCert.json");
  if (fs.existsSync(artifactPath)) {
    const artifact = JSON.parse(fs.readFileSync(artifactPath, "utf8"));
    fs.writeFileSync(path.join(webDir, "abi.json"), JSON.stringify(artifact.abi, null, 2));
  } else {
    console.warn("Artifact not found at", artifactPath, "— compile first.");
  }

  console.log("Wrote web/config.js and web/abi.json");
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});
