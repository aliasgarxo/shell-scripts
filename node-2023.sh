#!/bin/bash
sudo yum update && sudo yum upgrade -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node -v
nvm -v
