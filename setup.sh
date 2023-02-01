#!/bin/bash
sudo apt install tmux nano

cp .nanorc ~/
cp .tmux.conf ~/

cp .xmodmap ~/
#Reference: https://askubuntu.com/questions/137172/how-to-remap-super-left-key-to-control-key

xmodmap ~/.xmodmap

echo "All done! Happy programming :)"
