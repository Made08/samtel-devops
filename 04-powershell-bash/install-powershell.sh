sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/ubuntu/22.04/prod jammy main"

sudo apt update
sudo apt install -y powershell

pwsh