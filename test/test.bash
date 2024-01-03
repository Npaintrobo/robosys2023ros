#!/bin/bash
# SPDX-FileCopyrightText: 2023 Shinnosuke Nonaka 
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

ng () {
      echo NG at Line $1
      res=1
}

res=0

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
expect \"human:\"
send \"あいうえお\n\"
expect eof
'
"

#Parrot-node
timeout 10 ros2 run robosys2023ros parrot > parrot.log 2>&1

#parrot-log
grep -q 'aiueo' parrot.log || ng ${LINENO}
grep -q '123456789' parrot.log || ng ${LINENO}
grep -q 'a1b2c3d4e5' parrot.log || ng ${LINENO}
grep -aq 'あいうえお' parrot.log || ng ${LINENO}
[ "$res" = 0 ] && echo OK  
exit $res
