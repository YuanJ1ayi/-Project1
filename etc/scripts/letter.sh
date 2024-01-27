#!/bin/bash

ros2 service call /reset std_srvs/srv/Empty
ros2 service call /kill turtlesim/srv/Kill "{name: turtle1}"



ros2 service call /spawn turtlesim/srv/Spawn "{x: 4, y: 8, theta: 0, name: J }"
ros2 service call /spawn turtlesim/srv/Spawn "{x: 8, y: 8, theta: 0, name: I }"
ros2 service call /J/set_pen turtlesim/SetPen "{r: 0, g: 100, b: 255 ,width: 5}"
ros2 service call /I/set_pen turtlesim/SetPen "{r: 100, g: 100, b: 255 ,width: 5}"


ros2 topic pub --once /J/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0 , y: -5 , z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}"

ros2 topic pub --once /J/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0 , y: -5 , z: 0.0}, angular: {x: 0.0, y: 0.0, z: -3.14}}"

sleep 2

ros2 service call /I/teleport_absolute turtlesim/srv/TeleportAbsolute " {x: 8.0, y: 2.0, theta: 270}"

ros2 service call /kill turtlesim/srv/Kill "{name: J}"
ros2 service call /kill turtlesim/srv/Kill "{name: I}"


