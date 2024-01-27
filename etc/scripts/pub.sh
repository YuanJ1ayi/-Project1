#!/bin/bash

function pub() {
    local opt="$1"
    local topic_name="$2"
    local msg_type="$3"
    local msg="$4"
  ros2 topic pub $opt $topic_name $msg_type "$msg"
}
 pub "--rate 100" /drone/pose geometry_msgs/msg/Pose "{position: {x: 2.0, y: 0.0, z: 0.0}, orientation: {w: 1.0, x: 0.0, y: 0.0, z: 1.8}}"
pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.0, y: 4.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: -0.0}}"
pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.0, y: 5.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: -5.5}}"
