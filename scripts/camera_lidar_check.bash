#!/bin/bash

cameraName=${1:-"camera0"}

case $cameraName in
    camera0)
        camera_name=$cameraName
        image_frame="top_rear_center"
        lidar_name="rear_upper"
        ;;
    camera1)
        camera_name=$cameraName
        image_frame="left_center"
        lidar_name="left_lower"
        ;;
    camera2)
        camera_name=$cameraName
        image_frame="right_center"
        lidar_name="right_lower"
        ;;
    camera3)
        camera_name=$cameraName
        image_frame="top_front_right"
        lidar_name="front_upper"
        ;;
    camera4)
        camera_name=$cameraName
        image_frame="top_front_center_right"
        lidar_name="left_upper"
        ;;
    camera5)
        camera_name=$cameraName
        image_frame="top_front_left"
        lidar_name="left_upper"
        ;;
    camera6)
        camera_name=$cameraName
        image_frame="left_front"
        lidar_name="left_upper"
        ;;
    camera7)
        camera_name=$cameraName
        image_frame="right_front"
        lidar_name="right_upper"
        ;;
    camera8)
        camera_name=$cameraName
        image_frame="top_front_center_left"
        lidar_name="left_upper"
        ;;
    camera9)
        camera_name=$cameraName
        image_frame="right_rear"
        lidar_name="right_upper"
        ;;
    camera10)
        camera_name=$cameraName
        image_frame="left_rear"
        lidar_name="left_upper"
        ;;
    *)
        echo "指定されたカメラは存在しません: $cameraName" >&2
        exit 1
        ;;
esac

echo "Camera: $camera_name, Lidar: $lidar_name"

ros2 run tier4_calibration_views image_view_node.py \
    --ros-args \
    -r __node:=image_view_node_py \
    -r pointcloud:=/sensing/lidar/$lidar_name/pointcloud_raw_ex \
    -r image:=/sensing/camera/$camera_name/image_raw/compressed \
    -r camera_info:=/sensing/camera/$camera_name/camera_info \
    -p image_frame:=$image_frame/camera_optical_link \
    -p lidar_frame:=$lidar_name/lidar \
    -p parent_frame:=sensor_kit_base_link \
    -p child_frame:=$image_frame/camera_link
