cat ~/.ssh/id_rsa | gh secret set SSH_PRIVATE_KEY
cat ./secret_sudo_password | gh secret set SUDO_PASSWORD
