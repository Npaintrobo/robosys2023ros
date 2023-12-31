#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
echo "aiueo" >> aiueo.txt


gnome-terminal -- bash -c "script parrot.log & timeout 20 ros2 run robosys2023ros parrot;exit;"
sleep 3
gnome-terminal -- bash -c "
expect -c '
spawn ros2 run robosys2023ros human
expect \"human:\"
send \"aiueo\n\"
expect eof
'
"

sleep 6

cat parrot.log



