#!/bin/sh
cat /proc/version | grep -o -m 1 "ubuntu\|arch\|fedora\|debian\|majaro\|alpine\|soda\|instant\|pop_os!"
