#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

gnome-terminal -- bash -c "ros2 run robosys2023ros parrot; top"
echo 'aiueo' | ros2 run robosys2023ros human

#cat /tmp/robosys2023ros.log | grep 'aiueo'

