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

# Parrot-node
(ros2 run robosys2023ros parrot > /tmp/robosys2023ros.log)&

# Human-node
{
 (sleep 5 && echo "aiueo" && sleep 1 && echo "123456789" && sleep 1 && echo "a1b2c3d4e5") |  ros2 run robosys2023ros human
}


# Parrot-log
cat /tmp/robosys2023ros.log | grep 'aiueo' || ng ${LINENO}
cat /tmp/robosys2023ros.log | grep '123456789' || ng ${LINENO}
cat /tmp/robosys2023ros.log | grep 'a1b2c3d4e5' || ng ${LINENO}

echo ""
[ "$res" = 0 ] && echo "OK"
exit $res

