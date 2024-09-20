#!/bin/bash

# variables
VAULT_PASSWORD=$(openssl rand -base64 12)
VAULT_PASSWORD_FILE="ansible/vault.txt"
VAULT_FILE="ansible/secret"

SUDO_PASSWORD="$1"
SUDO_PASSWORD_FILE="/tmp/sudo-password"

# sudo passord is required
if [ -z "${SUDO_PASSWORD}" ]; then
    echo "Usage: $0 <sudo-password>"
    exit 1
fi

# create vault password file
echo "${VAULT_PASSWORD}" > "${VAULT_PASSWORD_FILE}"

# create a sudo password file
echo "ansible_sudo_pass: \"${SUDO_PASSWORD}\"" > "${SUDO_PASSWORD_FILE}"

# encrypt sudo password
ansible-vault encrypt --vault-password-file "${VAULT_PASSWORD_FILE}" "${SUDO_PASSWORD_FILE}" --output "${VAULT_FILE}"