#!/bin/bash
# start monitor mode
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
sudo iwconfig wlan0 | grep Mode
exit 0