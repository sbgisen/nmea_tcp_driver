#!/bin/bash

CMDNAME=`basename $0`

RTKLIB_PATH=$HOME/workspace/RTKLIB
PACKAGE_PATH=$HOME/ros/src/nmea_tcp_driver
BASE_NAME="CQ"

while getopts b:p:r: OPT
do
    case $OPT in
        "b" ) BASE_NAME="$OPTARG"; echo "Base station : $BASE_NAME" ;;
        "p" ) PACKAGE_PATH="$OPTARG" ; echo "Package path : $PACKAGE_PATH" ;;
        "r" ) RTKLIB_PATH="$OPTARG"; echo "RTKLIB path : $RTKLIB_PATH" ;;
          * ) echo "Usage : $CMDNAME [-d VALUE] [-p VALUE} [-s VALUE]"
    esac
done

echo "Base station : $BASE_NAME"
echo "Package path : $PACKAGE_PATH" 
echo "RTKLIB path : $RTKLIB_PATH"

$RTKLIB_PATH/app/rtkrcv/gcc/rtkrcv -o $PACKAGE_PATH/conf_rtklib/rtk_$BASE_NAME.conf -s
