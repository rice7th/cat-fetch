#!/bin/sh
cat /proc/version | grep -o -m 1 "ubuntu\|arch\|fedora"
