# **Remote Unlock for Moonlight and Sunshine**

This repository provides an AutoHotkey-based solution for setting up remote unlock functionality between a Windows client PC (running Moonlight) and a Sunshine server PC. The scripts are designed to create a smooth and (mostly) secure way to unlock your Sunshine server PC remotely.

## **Table of Contents**
- [Disclaimers](#disclaimers)
- [How It Works](#how-it-works)
- [Why Compile to Executables?](#why-compile-to-executables)
- [Setup Instructions](#setup-instructions)
  - [1. Changes to the Client-Side Script](#1-changes-to-the-client-side-script)
  - [2. Server-Side Script](#2-server-side-script)
  - [3. Compilation](#3-compilation)
- [Scripts](#scripts)
  - [Client-Side Script](#client-side-script-client_scriptahk)
  - [Server-Side Script](#server-side-script-server_scriptahk)
- [Additional Notes](#additional-notes)

---

## **Disclaimers**

- **Security**: This setup requires you to save RDP credentials on the client PC. Ensure your client PC is secure, as this could pose a security risk if compromised.
- **Responsibility**: This solution is provided as-is. I am not responsible for the security of your systems. Use this guide at your own risk.
- **Effort**: While this solution is shared freely, it took significant time and effort to create. Adapt it as needed for your own use, and please respect the effort that went into making it.

If you found this project useful and want to support future work, please consider buying me a coffee:  
<a href="https://www.buymeacoffee.com/anthonymkz" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

---

## **How It Works**

1. **Client-Side Script**:  
   - Initializes an RDP session to the Sunshine server PC using a pre-configured `.rdp` file.  
   - Simulates pressing "Enter" to close any disconnection dialog boxes once the session is handed off.

2. **Server-Side Script**:  
   - Transfers the RDP session to the console session, effectively unlocking the Sunshine server PC locally.  
   - Ensures the PC remains accessible and operational even after the RDP session ends.

3. **Triggering the Scripts**:  
   - The scripts can be triggered using **Home Assistant** or any other automation tool capable of running scripts at specific times.

---

## **Why Compile to Executables?**

I compiled the scripts into executables for the following reasons, but this is optional:
- **Ease of Use**: You don’t need AutoHotkey installed to run the scripts.
- **Security**: Compiling prevents users from accidentally modifying the scripts and makes it harder to tamper with sensitive details like the hashed PIN.
- **Administrator Privileges**: The server-side executable can be configured to always run as an administrator without additional user input.

---

## **Setup Instructions**

### **1. Changes to the Client-Side Script**
- **PIN Security**:  
  - Set a PIN in the script for added security.  
  - The script uses an MD5 hash of the PIN (instead of plain text) for storage.  
  - You can generate the MD5 hash for your PIN using an online tool like [MD5 Hash Generator](https://www.md5hashgenerator.com/) and replace the placeholder `<MD5_HASH_OF_YOUR_PIN>` in the script.
- **RDP File Path**:  
  - Update the path in the script to point to your `.rdp` file for the server PC.

### **2. Server-Side Script**
- The server-side script runs the `tscon` command to transfer the RDP session to the console.

### **3. Compilation** (Optional)
- Use the AutoHotkey compiler to convert the scripts into `.exe` files:
  - Right-click the `.ahk` file and select **Compile Script**.
- For the server-side executable:
  - Configure it to always run as an administrator by right-clicking the `.exe`, selecting **Properties**, going to **Compatibility**, and checking **Run this program as an administrator**.
