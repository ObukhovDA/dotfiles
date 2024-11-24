#!/bin/bash

# Устанавливаем случайные обои из папки
WALLPAPER_DIR="$HOME/Downloads/wallpaper"
SELECTED_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Команда для смены обоев, например, с помощью swww
swww img "$SELECTED_WALL" --transition-step 60