# DragonFlame Crowdfunding  

**by Juan Pablo Conrado Molina**  
Eng Electronic Student | Full Stack Junior Java Developer | Solidity & Web3 Builder  
Bogotá, Colombia  
🔗 [LinkedIn](https://www.linkedin.com/in/juan-pablo-conrado-855722315)  
💻 [GitHub](https://github.com/JuanWimmin)

**Smart Contract Suite for Token-Based and NFT-Backed Crowdfunding**  
**Conjunto de Contratos Inteligentes para Crowdfunding Basado en Tokens y NFTs**  
_Developed by / Desarrollado por **Juan Pablo Conrado Molina**_

---

## Overview / Descripción General  

**EN:**  
**DragonFlame Crowdfunding** is a decentralized crowdfunding protocol built on Ethereum-compatible networks.  
It enables creators to launch campaigns where investors receive ERC20 tokens and ERC721 NFTs as tier rewards.  

**ES:**  
**DragonFlame Crowdfunding** es un protocolo de crowdfunding descentralizado, implementado sobre redes compatibles con Ethereum.  
Permite que los creadores lancen campañas donde los inversores reciben **tokens ERC20** y **NFTs ERC721** como recompensas o niveles de participación.

---

## Architecture / Arquitectura  

| Contract | Purpose / Propósito | Inherits From / Hereda de |
|-----------|---------------------|----------------------------|
| `DragonFlameToken.sol` | ERC20 utility token for project rewards | `ERC20`, `Ownable` |
| `DragonFlameNFT.sol` | ERC721 NFT representing exclusive investor tiers | `ERC721URIStorage`, `Ownable` |
| `DragonFlameCrowdfunding.sol` | Manages investor registration, token and NFT distribution | `Ownable`, `ReentrancyGuard` |

---

##  Core Functionalities / Funcionalidades Principales  

**EN:**
1. **Investor Registration:** Users can register as Type 1 (tokens only) or Type 2 (tokens + NFT).  
2. **Automatic Distribution:** Tokens and NFTs are distributed upon registration.  
3. **Security Layers:** `Ownable` restricts access; `ReentrancyGuard` prevents reentrancy attacks.  
4. **Crowdfunding Lifecycle:** Owner can end the campaign; no new investors after closure.

**ES:**
1. **Registro de Inversores:** Los usuarios pueden registrarse como Tipo 1 (solo tokens) o Tipo 2 (tokens + NFT).  
2. **Distribución Automática:** Los activos se entregan al momento del registro.  
3. **Capa de Seguridad:** `Ownable` restringe funciones críticas; `ReentrancyGuard` protege de ataques de reentrada.  
4. **Ciclo de Vida:** El propietario puede finalizar la campaña; no se permiten más registros después.

---

## Project Structure / Estructura del Proyecto  

CrowdFund/
├── contracts/
│ ├── DragonFlameCrowdfunding.sol
│ ├── DragonFlameToken.sol
│ └── DragonFlameNFT.sol
│
├── scripts/
│ ├── deploy.js
│ ├── uploadMetadata.js
│ └── verify.js
│
├── test/
│ └── DragonFlameCrowdfunding.test.js
│
├── .env.example
├── .gitignore
├── hardhat.config.js
├── package.json
└── README.md

##  Setup Instructions / Instrucciones de Configuración  

### 1 Clone and install dependencies / Clonar e instalar dependencias  

git clone https://github.com/<your-username>/DragonFlame-Crowdfunding.git
cd DragonFlame-Crowdfunding
npm install
### 2
PRIVATE_KEY=YOUR_PRIVATE_KEY
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_KEY
PINATA_API_KEY=YOUR_PINATA_KEY
PINATA_SECRET_KEY=YOUR_PINATA_SECRET

### 3

npx hardhat compile
npx hardhat test
npx hardhat run scripts/deploy.js --network sepolia
npx hardhat verify --network sepolia <contract_address> <constructor_args>


## Technical Stack / Pila Tecnológica

| Layer / Capa                      | Technology / Tecnología                 |
| --------------------------------- | --------------------------------------- |
| Language / Lenguaje               | Solidity ^0.8.15                        |
| Framework                         | Hardhat                                 |
| Security / Seguridad              | OpenZeppelin (Ownable, ReentrancyGuard) |
| Deployment / Despliegue           | Alchemy RPC + Hardhat Network           |
| Verification / Verificación       | Etherscan API                           |
| Metadata Storage / Almacenamiento | Pinata (IPFS)                           |
| Testing / Pruebas                 | Hardhat + Mocha + Chai                  |

## Design Principles / Principios de Diseño

Security first: nonReentrant modifiers and ownership controls.

Scalability through modular contract design.

Transparency via public mappings and events.

Extensible to DAO voting or dynamic pricing.

## Development Roadmap / Hoja de Ruta

| Milestone | Description / Descripción                 | Status   |
| --------- | ----------------------------------------- | -------- |
|  v1.0.0  | Base ERC20 + ERC721 + Crowdfunding logic  | Complete |
|  v1.1.0  | Dynamic tiers, investment goals           | Planned  |
|  v2.0.0  | Stellar + Soroban cross-chain integration | Research |


## License / Licencia  

Licensed under **GPL-3.0**  
Distribuido bajo la licencia **GPL-3.0** — ver el archivo [LICENSE](./LICENSE).



“Developed with passion for open-source and blockchain innovation.”
