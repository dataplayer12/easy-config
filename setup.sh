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

echo "All done! Happy programming :)"
