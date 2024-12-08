#!/bin/bash

# Определение текущего активного рабочего пространства
current_workspace=$(hyprctl activewindow | grep "workspace:" | cut -d ':' -f 2 | awk '{print $1}')

# Список всех рабочих пространств
workspaces=$(hyprctl workspaces | grep "ID" | awk '{print $2}')

# Иконка Pac-Man для активного рабочего пространства
pacman_icon=""
ghost_icon=""  # Иконка "призрака" для неактивных

output=""

# Перебираем все рабочие пространства и добавляем иконку Pac-Man для активного
for ws in $workspaces; do
  if [ "$ws" == "$current_workspace" ]; then
    output+=" $pacman_icon "  # Добавляем Pac-Man для активного рабочего пространства
  else
    output+=" $ghost_icon "  # Призрак для остальных
  fi
done

# Формируем корректный JSON-вывод
echo "{\"workspaces\": \"$output\"}"