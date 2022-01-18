#!/bin/sh
#Wm script by Alberto Salvia Novella (es20490446e.wordpress.com)
OS=$(cat /proc/version | grep -o -m 1 "ubuntu\|arch\|fedora\|debian\|manjaro\|alpine\|soda\|instant\|pop_os\|redhat\|red hat\|centos\|parabola\|arco\|opensuse\|suse\|void\|steam\|mx\|gentoo\|calculate")
WM=$(id=$(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'); xprop -id "${id}" -notype -f _NET_WM_NAME 8t | grep "_NET_WM_NAME = " | cut --delimiter=' ' --fields=3 | cut --delimiter='"' --fields=2)
echo "os:${OS}, wm:${WM}"
