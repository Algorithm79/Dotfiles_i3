#!/bin/bash

#      _                 _                 _ 
#   __| |_   _ _ __  ___| |___      ____ _| |
#  / _` | | | | '_ \/ __| __\ \ /\ / / _` | |
# | (_| | |_| | | | \__ \ |_ \ V  V / (_| | |
#  \__,_|\__,_|_| |_|___/\__| \_/\_/ \__,_|_|
# Author: Kwest Ambani
# Created: 02.08.19

# get pywal colors
kolor00=$(sed -n 1p ~/.cache/wal/colors)
kolor01=$(sed -n 2p ~/.cache/wal/colors)
kolor02=$(sed -n 3p ~/.cache/wal/colors)
kolor03=$(sed -n 4p ~/.cache/wal/colors)
kolor04=$(sed -n 5p ~/.cache/wal/colors)
kolor05=$(sed -n 6p ~/.cache/wal/colors)
kolor06=$(sed -n 7p ~/.cache/wal/colors)
kolor07=$(sed -n 8p ~/.cache/wal/colors)
kolor08=$(sed -n 9p ~/.cache/wal/colors)
kolor09=$(sed -n 10p ~/.cache/wal/colors)
kolor10=$(sed -n 11p ~/.cache/wal/colors)
kolor11=$(sed -n 12p ~/.cache/wal/colors)
kolor12=$(sed -n 13p ~/.cache/wal/colors)
kolor13=$(sed -n 14p ~/.cache/wal/colors)
kolor14=$(sed -n 15p ~/.cache/wal/colors)
kolor15=$(sed -n 16p ~/.cache/wal/colors)

# inject pywal colors into dunst config
sed -i "s/background = .*/background = \"$kolor00\"/g" ~/.config/dunst/dunstrc
sed -i "s/foreground = .*/foreground = \"$kolor04\"/g" ~/.config/dunst/dunstrc
sed -i "s/frame_color = .*/frame_color = \"$kolor04\"/g" ~/.config/dunst/dunstrc

pkill dunst
dunst &

