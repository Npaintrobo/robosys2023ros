#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

#Human-node
gnome-terminal -- bash -c "
sleep 4
expect -c '
spawn ros2 run robosys2023ros human
expect \"human:\"
send \"aiueo\n\"
expect \"human:\"
send \"123456789\n\"
expect \"human:\"
send \"a1b2c3d4e5\n\"
expect eof
'
"

#Parrot-node
timeout 10 ros2 run robosys2023ros parrot > parrot.log 2>&1

#parrot-log
grep_result=$(cat parrot.log | grep -e 'aiueo' -e '123456789' -e 'a1b2c3d4e5')
echo "$grep_result"
if [ -n "$grep_result" ]; then
  echo "OK"
else
  echo "test failed"
fi
