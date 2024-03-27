#!/bin/bash
IMAGE="~/.dotfiles/roles/x/files/images/plasma-wallpaper.jpg"
if [ hash feh 2>/dev/null ] && [ -f  "$IMAGE" ]; then
    feh --bg-scale $IMAGE
fi
