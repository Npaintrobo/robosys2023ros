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

# Human-node
{
 (sleep 10 ; echo "aiueo"; sleep 1; echo "123456789"; sleep 1; echo "a1b2c3d4e5") |  ros2 run robosys2023ros human
}&
# Parrot-node
(sleep 5; ros2 run robosys2023ros parrot > /tmp/parrot.log 2>&1)&
{
 sleep 20
 # Parrot-log
 (cat /tmp/parrot.log | grep -a 'aiueo' || ng ${LINENO})
 (cat /tmp/parrot.log | grep -a '123456789' || ng ${LINENO})
 (cat /tmp/parrot.log | grep -a 'a1b2c3d4e5' || ng ${LINENO})
}
echo ""

[ "$res" = 0 ] && echo "OK"
exit $res

