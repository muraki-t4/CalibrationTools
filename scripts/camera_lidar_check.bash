#!/bin/bash

PS3='確認するカメラの左の数字(1~8)を入力してください: '
options=("camera0" "camera1" "camera2" "camera3" "camera4" "camera5" "camera6" "camera7" "camera8" "camera9" "camera10")
select cameraName in "${options[@]}"
do
    case $cameraName in
        "camera0")
            camera_name=$cameraName
            image_frame="top_rear_center"
            lidar_name="rear_upper"
            break;;
        "camera1")
            camera_name=$cameraName
            image_frame="left_center"
            lidar_name="left_lower"
            break;;
        "camera2")
            camera_name=$cameraName
            image_frame="right_center"
            lidar_name="right_lower"
            break;;
        "camera3")
            camera_name=$cameraName
            image_frame="top_front_right"
            lidar_name="front_upper"
            break;;
        "camera4")
            camera_name=$cameraName
            image_frame="top_front_center_right"
            lidar_name="left_upper"
            break;;
        "camera5")
            camera_name=$cameraName
            image_frame="top_front_left"
            lidar_name="left_upper"
            break;;
        "camera6")
            camera_name=$cameraName
            image_frame="left_front"
            lidar_name="left_upper"
            break;;
        "camera7")
            camera_name=$cameraName
            image_frame="right_front"
            lidar_name="right_upper"
            break;;
        "camera8")
            camera_name=$cameraName
            image_frame="top_front_center_left"
            lidar_name="left_upper"
            break;;
        "camera9")
            camera_name=$cameraName
            image_frame="right_rear"
            lidar_name="right_upper"
            break;;
        "camera10")
            camera_name=$cameraName
            image_frame="left_rear"
            lidar_name="left_upper"
            break;;
        *)
            echo "指定されたカメラは存在しません"
            ;;
    esac
done

echo "カメラ: $camera_name"

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
