#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 60 ros2 robosys2023ros  robosys2023ros parrot.py > /tmp/parrot.log

cat /tmp/parrot.log |
grep 'Published:'
