#!/bin/bash
sudo apt install tmux nano

cp .nanorc ~/
cp .tmux.conf ~/

cp .xmodmap ~/
#Reference: https://askubuntu.com/questions/137172/how-to-remap-super-left-key-to-control-key

xmodmap ~/.xmodmap


if [[ $(uname -m) == *"x86"* ]]; then
  echo 'alias gpu="watch -n 1 nvidia-smi"' >> ~/.bashrc
elif [[ $(uname -m) == *"aarch64"* ]]; then
  echo 'alias gpu="jtop"' >> ~/.bashrc
# If the system architecture is neither x86 nor ARM (aarch64), print an error message
else
  echo "Error: Unsupported system architecture"
  exit 1
fi

source ~/.bashrc

sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://azlux.fr/repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
  $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azlux.list >/dev/null
sudo apt-get update
sudo apt-get install docker-ctop

echo "All done! Happy programming :)"
