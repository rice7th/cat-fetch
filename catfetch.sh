#!/usr/bin/env bash

#COLOR VARIABLES
RED="\x1b[31m"
YELLOW="\x1b[33m"
GREEN="\x1b[32m"
CYAN="\x1b[36m"
BLUE="\x1b[34m"
PURPLE="\x1b[35m"
BLACK="\x1b[30m"
WHITE="\x1b[37m"
B_RED="\x1b[91m"
B_YELLOW="\x1b[93m"
B_GREEN="\x1b[92m"
B_CYAN="\x1b[96m"
B_BLUE="\x1b[94m"
B_PURPLE="\x1b[95m"
B_WHITE="\x1b[97m"
GRAY="\x1b[90m"
CLS="\x1b[0m"

# CUSTOMIZZATION ZONE
# Cool characters for the symbol ◆ ◀ ▧ ▨ ▦ ▥ ▤ ▣ ● ◕ █
SYMBOL="●"
SEPARATOR="-"


TXTCOL=$YELLOW
WORDCOL=$GREEN
CATCOL=$CYAN


# TESTS ZONE
#Wm script by Alberto Salvia Novella (es20490446e.wordpress.com)
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
RAM=$(free -h | grep "^Mem:" | awk '{print $3 "/" $2}')
OS=$(cat /proc/version | grep -o -m 1 "ubuntu\|arch\|fedora\|debian\|manjaro\|alpine\|soda\|instant\|pop_os\|redhat\|red hat\|centos\|parabola\|arco\|opensuse\|suse\|void\|steam\|mx\|gentoo\|calculate" | uniq)
WM=$(id=$(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'); xprop -id "${id}" -notype -f _NET_WM_NAME 8t | grep "_NET_WM_NAME = " | cut --delimiter=' ' --fields=3 | cut --delimiter='"' --fields=2)
ARCH=$(uname -m)
NODE=$(uname -n)
KERNEL_NAME=$(uname -s)
KERNEL_REL=$(uname -r)

SHELL_NAME=$(basename $SHELL)

#source: https://unix.stackexchange.com/a/681480
SESSION=${DISPLAY:+X11}${WAYLAND_DISPLAY:+WAYLAND}
UPTIME=$(uptime -p)

Help()
{
        printf "
-m      Adds the system architecture and graphic session(X11 or WAYLAND) to the output
-d      Adds your dark color palette to the output
-b      Adds your bright color palette to the output
-a	Adds all of the options above
-h      Shows this help message\n
This program is licensed under the GPLv3 license.\n
If you encounter any issue or want a feature to be added please open an issue on the GitHub page.
https://github.com/jhonnyrice/cat-fetch-reborn\n
"
}

ExtraInfo()
{
	echo -e "                ${WORDCOL}arch:    ${TXTCOL}${ARCH}"
	echo -e "                ${WORDCOL}graphic session: ${TXTCOL}${SESSION}"
	echo -e "                ${WORDCOL}cpu:     ${TXTCOL}${CPU:13}"
	echo -e "                ${WORDCOL}ram:     ${TXTCOL}${RAM}"
}

DarkColor()
{
	echo -e "                ${RED} ${SYMBOL} ${YELLOW} ${SYMBOL} ${GREEN} ${SYMBOL} ${CYAN} ${SYMBOL} ${BLUE} ${SYMBOL} ${PURPLE} ${SYMBOL} ${WHITE} ${SYMBOL} ${BLACK} ${SYMBOL} ${CLS}"
}

BrightColor()
{
	echo -e "                ${B_RED} ${SYMBOL} ${B_YELLOW} ${SYMBOL} ${B_GREEN} ${SYMBOL} ${B_CYAN} ${SYMBOL} ${B_BLUE} ${SYMBOL} ${B_PURPLE} ${SYMBOL} ${B_WHITE} ${SYMBOL} ${GRAY} ${SYMBOL} ${CLS}"
}

Separator()
{
printf "                ${CLS}"
for (( i=0; i<24; i++ )); do printf "-"; done
printf "\e[0m\n"
}

printf "                $NODE@$LOGNAME\n                "
LENGTH=${#NODE}+${#LOGNAME}+1
for (( i=0; i<${LENGTH}; i++ )); do printf "-"; done

printf "\e[0m\n"
echo -e "${CATCOL}   /'._         ${WORDCOL}os:      ${TXTCOL}${OS}"
echo -e "${CATCOL}  (° o 7        ${WORDCOL}wm:      ${TXTCOL}${WM}"
echo -e "${CATCOL}   |'-'\"~.  .   ${WORDCOL}shell:   ${TXTCOL}${SHELL_NAME}"
echo -e "${CATCOL}   Uu^~C_J._.\"  ${WORDCOL}uptime:  ${TXTCOL}${UPTIME:3}"
echo -e "${CATCOL}                ${WORDCOL}kernel:  ${TXTCOL}${KERNEL_NAME} ${KERNEL_REL}"
printf "\e[0m"

while getopts ":hmabd" option; do
   case $option in
      h) #	Get help message
	 printf "\e[0m"
	 Help
	 exit;;
      m) #	Get more info
	 ExtraInfo
	 printf "\e[0m";;
      a) # 	Get all of the info
         ExtraInfo
	 Separator
	 DarkColor
	 BrightColor
	 printf "\e[0m";;
      b) #      Display bright colors
         BrightColor
	 printf "\e[0m";;
      d) #	Display dark colors
	 DarkColor
	 printf "\e[0m";;
      ?) #     Get output
	 printf "\e[0m\n"
         echo "This option does not exist. For the full list of options please use the command 'catfetch -h'"
         exit;;
   esac
done


# /'._   ._
#(- = 7___.~'
# |--''   )
# LL_)'CC_J
