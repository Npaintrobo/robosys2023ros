#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd "$dir/ros2_ws"
colcon build
source "$dir/.bashrc"

ng() {
    echo "NG at Line $1"
    res=1
}

res=0

parrot_log=$(mktemp)

# Parrot-node
(ros2 run robosys2023ros parrot > "$parrot_log" 2>&1)&

# Human-node
{
 (sleep 4 ; echo "aiueo"; sleep 1; echo "123456789"; sleep 1; echo "a1b2c3d4e5") |  ros2 run robosys2023ros human
}

sleep 20

# Check Parrot-log
cat "$parrot_log" | grep 'aiueo' || ng ${LINENO}
cat "$parrot_log" | grep '123456789' || ng ${LINENO}
cat "$parrot_log" | grep 'a1b2c3d4e5' || ng ${LINENO}

rm "$parrot_log"

echo ""
[ "$res" = 0 ] && echo "OK"
exit $res

