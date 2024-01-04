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
 (sleep 2 && echo "aiueo" && sleep 1 && echo "123456789" && sleep 1 && echo "a1b2c3d4e5") | timeout 10 ros2 run robosys2023ros human
} &

# Parrot-node
timeout 20 ros2 run robosys2023ros parrot > /tmp/robosys22023ros.log

# Parrot-log
grep -q 'aiueo' /tmp/robosys22023ros.log || ng ${LINENO}
grep -q '123456789' /tmp/robosys22023ros.log || ng ${LINENO}
grep -q 'a1b2c3d4e5' /tmp/robosys22023ros.log || ng ${LINENO}

echo ""
[ "$res" = 0 ] && echo "OK"
exit $res

