#!/bin/bash

# curl -s "https://raw.githubusercontent.com/nihaals/apt-get-replace/master/install.sh" | bash -s

if [[ "$1" == "--dev" ]]; then
  branch="dev"
  shift 1
else
  branch="master"
fi

base_raw="https://raw.githubusercontent.com/nihaals/apt-get-replace"

mkdir -p "/opt/apt-get-replace/bin"

wget -qO "/opt/apt-get-replace/apt-get-replace" \
  "${base_raw}/${branch}/src/apt-get-replace"
wget -qO "/opt/apt-get-replace/bin/apt-get" \
  "${base_raw}/${branch}/src/apt-get"
wget -qO "/opt/apt-get-replace/bin/apt-cache" \
  "${base_raw}/${branch}/src/apt-cache"

chmod +x -R /opt/apt-get-replace/

printf "\nexport PATH=\"/opt/apt-get-replace/bin:\$PATH\"\n" | tee -a ~/.profile > /dev/null

# if [[ -d "~/.config/fish" ]]; then
#   printf "\nset -gx PATH /opt/apt-get-replace/bin $PATH\n" | tee -a ~/.config/fish/config.fish > /dev/null
# fi

echo "Done"
