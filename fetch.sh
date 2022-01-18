#!/bin/bash
#Wm script by Alberto Salvia Novella (es20490446e.wordpress.com)

OS=$(cat /proc/version | grep -o -m 1 "ubuntu\|arch\|fedora\|debian\|manjaro\|alpine\|soda\|instant\|pop_os\|redhat\|red hat\|centos\|parabola\|arco\|opensuse\|suse\|void\|steam\|mx\|gentoo\|calculate" | uniq)
WM=$(id=$(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'); xprop -id "${id}" -notype -f _NET_WM_NAME 8t | grep "_NET_WM_NAME = " | cut --delimiter=' ' --fields=3 | cut --delimiter='"' --fields=2)
ARCH=$(uname -m)
NODE=$(uname -n)
KERNEL_NAME=$(uname -s)
KERNEL_REL=$(uname -r)
#source: https://unix.stackexchange.com/a/371164/27362
SESSION=$(loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type | grep -o -i "wayland\|x11")

UPTIME=$(uptime -p)

# Cool characters for the symbol ◆ ◀ ▧ ▨ ▦ ▥ ▤ ▣ ● ◕ █
SYMBOL="●"
SEPARATOR="-"
echo "${NODE}"
for i in {1..20}
do
    printf "${SEPARATOR}"
done
printf "\n"

echo "   /'._        os:     ${OS}"
echo "  (° o 7       wm:     ${WM}"
echo "   |'-'\"~.  .  arch:   ${ARCH}"
echo "   Uu^~C_J._.\" kernel: ${KERNEL_NAME} ${KERNEL_REL}"
echo "               graphic session : ${SESSION}"
echo "               uptime : ${UPTIME}"
echo "               shell : $SHELL"
echo -e " \x1b[31m ${SYMBOL} \x1b[33m ${SYMBOL} \x1b[32m ${SYMBOL} \x1b[36m ${SYMBOL} \x1b[34m ${SYMBOL} \x1b[35m ${SYMBOL} \x1b[37m ${SYMBOL} \x1b[90m ${SYMBOL}\x1b[0m"
