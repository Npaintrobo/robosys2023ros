#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

gnome-terminal -- bash -c "
sleep 3
expect -c '
spawn ros2 run robosys2023ros human
expect \"human:\"
send \"aiueo\n\"
expect eof
'
"

timeout 10 ros2 run robosys2023ros parrot > parrot.log 2>&1

echo test
cat parrot.log|
grep 'parrot'






