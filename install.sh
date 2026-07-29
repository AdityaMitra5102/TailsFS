#!/usr/bin/env bash

echo "[-] Removing existing installation. This will remove all encrypted files..."
rm -rf ~/.config/TailsFS.conf
rm -rf ~/.tailsfs

echo "[*] Updating package lists..."
sudo apt update

echo "[*] Installing required system packages and C headers..."
sudo apt install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    pkg-config \
    fuse3 \
    libfuse3-dev \
    pcscd \
    libpcsclite-dev \
    libssl-dev \
    libffi-dev \
    libnotify-bin

echo "[*] Starting and enabling PC/SC smartcard service for FIDO2..."
sudo systemctl enable --now pcscd

echo "[+] System dependencies installed successfully!"

python3 -m pip install -r requirements.txt --break-system-packages

echo "[+] Python dependencies installed successfully!"

sudo cp tailsfs /usr/local/bin/
sudo cp tailsfs-register /usr/local/bin/

sudo chmod +x /usr/local/bin/tailsfs
sudo chmod +x /usr/local/bin/tailsfs-register

mkdir -p ~/.config/systemd/user/
cp tailsfs.service ~/.config/systemd/user/
systemctl --user daemon-reload

tailsfs-register

systemctl --user enable --now tailsfs.service
