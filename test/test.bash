#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ng() {
    echo "NG at Line $1"
    res=1
}

res=0

touch test.log

# Parrot-node
(ros2 run robosys2023ros parrot > test.log)&
# Human-node
{
 (echo "aiueo"; sleep 1; echo "123456789"; sleep 1; echo "a1b2c3d4e5") |  ros2 run robosys2023ros human
}

sleep 20

# Parrot-log
cat test.log | grep 'aiueo' || ng ${LINENO}
cat test.log | grep '123456789' || ng ${LINENO}
cat test.log | grep 'a1b2c3d4e5' || ng ${LINENO}

rm test.log
echo ""
[ "$res" = 0 ] && echo "OK"
exit $res

