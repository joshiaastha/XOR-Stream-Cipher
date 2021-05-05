## Problem Statement
With our ever-increasing digitalization & use of IT in various personal,
industrial & commercial domain, the problem of cyber security and
privacy has become extremely eminent in the recent times. So, it’s crucial
to have fast, efficient, low-latency and secure encrypting/decrypting
systems in all of our sensitive data transmissions.
A dedicated Hardware module focussing solely encrypting & decrypting
data, provides effective protection against various cyber-attacks. A
dedicated & stand-alone hardware module is completely sandboxed and
hence even if the security of an entire IT System is compromised, the
hardware module is secure. Also, a hardware module can be optimised &
parallelised to a very high extent, for a given algorithm, which is not
possible in software implementation of the same. Therefore, having a
FPGA-based module provides both security and speed for securing the
digital communications systems.

## Introduction
This project aims at performing data encryption & decryption in VHDL using XOR Stream Cipher Algorithm. VHDL code and Test Bench for verification is given below.
In this project, a plain text message is read from “message.txt” file, a random key is generated per character and bitwise XOR operation is performed and the cipher text & Cipher key is stored in "CipherText.txt" and “RandomKey.txt” file. Similarly, decryption operation is performed using the same key, and the decrypted text is stored in "DecryptedText.txt".
