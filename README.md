# Decentralized Skill Certificate Verification System  

## Team Details  
- **Team Name:** Code Clickers  
### Members  
- *Jero Grabo* – Blockchain Architect & Chief Coder  
- *Hulash Sahu* – PPT Designer  
- *Chandan Chandrakar* – PPT Designer  
- *Karan Sahu* – Testing  

## Problem Statement  
Traditional skill certificates are easy to forge, hard to verify, and lack a trusted decentralized validation system.  

## Project Description  
This project is a **Blockchain-based decentralized platform** that allows institutions to issue tamper-proof skill certificates and individuals/employers to verify them in real time.  

- Certificates are stored on-chain as immutable records.  
- Verification is trustless – no third-party dependency.  
- User-friendly DApp interface for issuing and validating certificates.  
- Secure hash-based storage to ensure certificate originality.  

## Tech Stack Used  
- **Blockchain:** Ethereum (Hardhat)  
- **Smart Contracts:** Solidity  
- **Backend:** Node.js  
- **Libraries/Tools:** Ethers.js, Hardhat, Mocha (for testing)  
- **Utilities:** IPFS/Hashing (hashFile.js)  

---

## 🚀 Installation & Usage  

### Prerequisites  
- Node.js (>=16)  
- npm  
- MetaMask browser extension  

---

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/CodeClickers-DecentralizedSkillCertificateVerificationSystem.git
cd CodeClickers-DecentralizedSkillCertificateVerificationSystem
```

### 2️⃣ Install Dependencies  
```bash
npm install
```

### 3️⃣ Start Local Blockchain (Hardhat Node)  
```bash
npx hardhat node
```
This will start a local Ethereum network with 20 pre-funded accounts.  
Keep this terminal window running.  

### 4️⃣ Deploy the Smart Contract  
Open a **new terminal** in the project folder and run:  
```bash
npx hardhat run scripts/deploy.js --network localhost
```
This will deploy the `SkillCert` contract to your local Hardhat blockchain.  

---

## 🦊 Setting up MetaMask for Local Testing  

1. Open MetaMask → Click **Networks** → **Add Network**.  
2. Fill in:  
   - **Network Name:** Hardhat Local  
   - **RPC URL:** `http://127.0.0.1:8545/`  
   - **Chain ID:** `31337`  
   - **Currency Symbol:** ETH  
3. Import a test account:  
   - In the Hardhat node terminal, copy a private key from one of the accounts.  
   - In MetaMask → Import Account → Paste the private key.  
   - Now you’ll have test ETH to interact with the contract.  

---

## 🛠️ Manual Startup (Frontend / DApp)  

If your project has a frontend DApp (React/HTML):  
```bash
cd frontend   # (if a frontend folder exists)
npm install
npm start
```

Then open **http://localhost:3000** in your browser, connect MetaMask, and start issuing/verifying certificates.  

---

## ✅ Running Tests  
```bash
npx hardhat test
```

---

## 🌐 Live Demo / Deployment  
Currently hosted locally on **Hardhat Network** for testing.  
Deployment on a public testnet (e.g., Sepolia) is planned as a future enhancement.  

---

## 🎨 UI/UX / Design Link  
Not applicable – all UI is built directly in code.  

---

## 🔮 Future Enhancements  
- Add support for multi-chain deployment (Polygon, BSC).  
- Build mobile-friendly front-end.  
- Integration with universities/companies for direct issuance.  
- On-chain reputation/skill scoring system.  

https://drive.google.com/file/d/1_XlmOZrRBPjcuqqEAH8r6LJ8tjhrT1Em/view?usp=drive_link

