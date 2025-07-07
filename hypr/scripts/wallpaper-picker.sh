#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
SYMLINK="$WALLPAPER_DIR/selected.jpg"

# Select from list using rofi
wallpaper=$(find "$WALLPAPER_DIR" -type f ! -name "selected.jpg" \
  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
  | rofi -dmenu -p "Select Wallpaper")

[ -z "$wallpaper" ] && exit 1

# Update the symlink
ln -sf "$wallpaper" "$SYMLINK"

# Reload hyprpaper
pkill hyprpaper
hyprpaper & disown
