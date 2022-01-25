#!/usr/bin/env zsh

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
# Set colors
TXTCOL=$YELLOW
WORDCOL=$GREEN
CATCOL=$CYAN

Help()
{
        printf "
-m      Adds more info, like the system architecture and graphic session(X11 or WAYLAND) to the output
-d      Adds your dark color palette to the output
-b      Adds your bright color palette to the output
-c	Adds both your dark and bright color palette to the output
-a	Adds all of the options above
-h      Shows this help message\n
This program is licensed under the GPLv3 license.\n
If you encounter any issue or want a feature to be added please open an issue on the GitHub page.
https://github.com/jhonnyrice/cat-fetch\n
"
}

# TESTS ZONE

KERNEL_NAME=$(uname -s)
CPU=$(sysctl -n machdep.cpu.brand_string)
RAM=$(system_profiler SPHardwareDataType | grep "  Memory:")
OS_VER=$(sw_vers | grep -i "ProductVersion:")
OS="MacOs ${OS_VER:16}"
ARCH=$(uname -m)
NODE=$(uname -n)
KERNEL_REL=$(uname -r)
SHELL_NAME=${SHELL:5}
UPTIME=$(uptime | cut -d 'u' -f 2 | cut -d ',' -f 1) # ?  ?
USED_SPACE=$(df -h / | awk '{print $3}' | grep "^[0-9]")
TOTAL_SPACE=$(df -h / | awk '{print $2}' | grep "^[0-9]")
GPU=$(GPU_TEMP=$(system_profiler SPDisplaysDataType | tr -d '\n' | grep "Graphics/Displays:");echo ${GPU_TEMP:22} | cut -d ':' -f 1)

ExtraInfo()
{
    echo -e "                ${WORDCOL}arch:     ${TXTCOL}${ARCH}"
    echo -e "                ${WORDCOL}gpu:      ${TXTCOL}${GPU}"
    echo -e "                ${WORDCOL}ram:      ${TXTCOL}${RAM:6}"
    echo -e "                ${WORDCOL}space:    ${TXTCOL}${USED_SPACE} used, out of ${TOTAL_SPACE}"
}
echo -e "${CATCOL}                $NODE@$LOGNAME                ${CLS}"
LENGTH=${#NODE}+${#LOGNAME}+1
printf "                ${CLS}"
for (( i=0; i<LENGTH; i++ )); do printf "-"; done
printf "\e[0m\n"
echo -e "${CATCOL}   /'._         ${WORDCOL}os:       ${TXTCOL}${OS}"
echo -e "${CATCOL}  (° o 7        ${WORDCOL}kernel:   ${TXTCOL}${KERNEL_NAME} ${KERNEL_REL}"
echo -e "${CATCOL}   |'-'\"~.  .   ${WORDCOL}shell:    ${TXTCOL}${SHELL_NAME}"
echo -e "${CATCOL}   Uu^~C_J._.\"  ${WORDCOL}uptime:   ${TXTCOL}${UPTIME:3}"
echo -e "${CATCOL}                ${WORDCOL}cpu:      ${TXTCOL}${CPU:13}"
printf "\e[0m"

DarkColor()
{
	echo -e "                ${RED} ${SYMBOL} ${YELLOW} ${SYMBOL} ${GREEN} ${SYMBOL} ${CYAN} ${SYMBOL} ${BLUE} ${SYMBOL} ${PURPLE} ${SYMBOL} ${WHITE} ${SYMBOL} ${BLACK} ${SYMBOL} ${CLS}"
}

BrightColor()
{
	echo -e "                ${B_RED} ${SYMBOL} ${B_YELLOW} ${SYMBOL} ${B_GREEN} ${SYMBOL} ${B_CYAN} ${SYMBOL} ${B_BLUE} ${SYMBOL} ${B_PURPLE} ${SYMBOL} ${B_WHITE} ${SYMBOL} ${GRAY} ${SYMBOL} ${CLS}"
}

Color()
{
        echo -e "                ${RED} ${SYMBOL} ${YELLOW} ${SYMBOL} ${GREEN} ${SYMBOL} ${CYAN} ${SYMBOL} ${BLUE} ${SYMBOL} ${PURPLE} ${SYMBOL} ${WHITE} ${SYMBOL} ${BLACK} ${SYMBOL} ${CLS}"
	echo -e "                ${B_RED} ${SYMBOL} ${B_YELLOW} ${SYMBOL} ${B_GREEN} ${SYMBOL} ${B_CYAN} ${SYMBOL} ${B_BLUE} ${SYMBOL} ${B_PURPLE} ${SYMBOL} ${B_WHITE} ${SYMBOL} ${GRAY} ${SYMBOL} ${CLS}"
}

Separator()
{
printf "                ${CLS}"
for (( i=0; i<24; i++ )); do printf "-"; done
printf "\e[0m\n"
}
while getopts ":hmabdc" option; do
   case $option in
      h) #	Get help message
	 printf "${CLS}"
	 Help
	 exit;;
      m) #	Get more info
	 ExtraInfo
	 printf "${CLS}";;
      a) # 	Get all of the info
         ExtraInfo
	 Separator
	 DarkColor
	 BrightColor
	 printf "${CLS}";;
      b) #      Display bright color palette
         Separator
         BrightColor
	 printf "${CLS}";;
      d) #	Display dark color palette
         Separator
	 DarkColor
	 printf "${CLS}";;
      c) #	Display both bright and dark color palette
      	 Separator
	 DarkColor
	 BrightColor
	 printf "${CLS}";;
      ?) #     Get unknown command output
	 printf "${CLS}\n"
         echo "This option does not exist. For the full list of options please use the command 'catfetch -h'"
         exit;;
   esac
done


# /'._   ._
#(- = 7___.~'
# |--''   )
# LL_)'CC_J
