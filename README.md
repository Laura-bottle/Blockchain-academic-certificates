# Blockchain Academic Certificate Verification

## Overview
This project demonstrates a blockchain-based solution for managing academic certificates using a Solidity smart contract. It addresses issues such as certificate fraud, slow verification processes, and reliance on centralised systems.

## Features
- Issue academic certificates securely
- Verify certificates instantly
- Revoke invalid or fraudulent certificates

## Smart Contract Functions

### IssueCertificate
Allows an authorised institution to issue a new certificate and store it on the blockchain.

### VerifyCertificate
Enables third parties to verify the authenticity of a certificate using its ID.

### RevokeCertificate
Allows the institution to invalidate a certificate if necessary.


## Technology Used
- Solidity
- Remix IDE

## Purpose
This prototype demonstrates how blockchain can improve data governance by providing a secure, transparent, and tamper-proof system for academic credential management.

## How to Run the Project
1. Open Remix IDE (https://remix.ethereum.org)
2. Upload the AcademicCertificates.sol file
3. Compile using Solidity 0.8.x
4. Deploy using Remix VM
5. Use the functions:
   - IssueCertificate
   - VerifyCertificate
   - RevokeCertificate
  
## Limitations
- The system does not currently include duplicate validation checks
- Certificate data is stored in plain text, which may raise privacy concerns
- Requires adoption by institutions to be effective in real-world scenarios

## Assumptions
- The contract owner represents a trusted academic institution
- Certificate IDs are generated automatically and are unique
- Users have basic knowledge of blockchain tools such as Remix IDE
