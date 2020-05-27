#!/bin/bash

# bash <(curl -s https://raw.githubusercontent.com/nihaals/apt-get-replace/master/install.sh)

if [[ "$1" == "--dev" ]]; then
  branch="dev"
  shift 1
else
  branch="master"
fi

mkdir -p "/opt/apt-get-replace"

wget -qO "/opt/apt-get-replace/_apt-get-replace" \
  "https://raw.githubusercontent.com/nihaals/apt-get-replace/${branch}/src/apt-get-replace"
wget -qO "/opt/apt-get-replace/apt-get" \
  "https://raw.githubusercontent.com/nihaals/apt-get-replace/${branch}/src/apt-get"
wget -qO "/opt/apt-get-replace/apt-cache" \
  "https://raw.githubusercontent.com/nihaals/apt-get-replace/${branch}/src/apt-cache"

chmod +x -R /opt/apt-get-replace/

printf "\nexport PATH=\"/opt/apt-get-replace:\$PATH\"" | tee -a ~/.profile > /dev/null

echo "Done"
