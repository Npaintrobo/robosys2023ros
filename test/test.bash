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

touch /tmp/test.log

# Parrot-node
(ros2 run robosys2023ros parrot > /tmp/test.log 2>&1)&
# Human-node
{
 (sleep 4 ; echo "aiueo"; sleep 1; echo "123456789"; sleep 1; echo "a1b2c3d4e5") |  ros2 run robosys2023ros human
}

sleep 20

cat /tmp/test.log

# Parrot-log
cat /tmp/test.log | grep 'aiueo' || ng ${LINENO}
cat /tmp/test.log | grep '123456789' || ng ${LINENO}
cat /tmp/test.log | grep 'a1b2c3d4e5' || ng ${LINENO}

rm test.log
echo ""
[ "$res" = 0 ] && echo "OK"
exit $res

