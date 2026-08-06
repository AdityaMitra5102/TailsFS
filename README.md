# TailsFS

Encrypted file system with CTAP 2.3 Security Key. Plug out the key to lose access to all files. Plug back in to use.

## Problem statement

Encrypted drives like Bitlocker are complicated to set up, and often encrypts the whole drive. Further, once unlocked, the encryption key may stay on the host machine, thus making it vulnerable to sophisticated forensics based attacks. This brings us to TailsFS (not related in any way to Tails OS except borrowing the name and some behavior).

TailsOS works by using the HMAC Secret Extension of Yubikeys to store cryptographic secrets in a hardware backed manner. The key is loaded only on successful authentication with the key and immediately zeroized on removal. The custom file system mount is toggled on removal of the Yubikey to clean any type of cache stored by the operating system or the kernel.



## Install

Run the following on the user terminal (not root) on a Linux based system. Preferably Ubuntu or Debian to install. And follow the on-screen instructions to register the credential. You will be asked for `sudo` credentials in the process.

```
curl https://AdityaMitra5102.github.io/TailsFS/setup.sh | bash
```

And the system is ready to go.

## Demo video

[![Demo](https://img.youtube.com/vi/SqX3ShiY_XI/maxresdefault.jpg)](https://youtu.be/SqX3ShiY_XI)  