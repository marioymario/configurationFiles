export PATH="$HOME/.local/bin:$PATH"

#PS1="\[\e[32m\]\u@\h\[\e[35m\]:\w\[\e[0m\] "
PS1="\[\e[38;5;214m\]\u\[\e[32m\]:\w\[\e[0m\] "
#PS1="\e[38;5;214m\u@\h:\w \e[0m"

## aliases
alias supersu='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias ,l='ls -la -h'
alias ,ll='clear'
alias c=cd

## completion
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

clear

# Display system information in the terminal.
MY_IP=$(ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | uniq)
FECHA=$(date +%d/%m/%Y)
printf "\n"
echo '-------------------------------------------------------------------------------'
printf "\n"
printf '\033[00;32m'"%s   IP\t\t:\033[00m\033[01;32m$(curl ifconfig.me -4 2> /dev/null)\033[00m\n" 
#printf '\033[00;32m'"%s   FECHA\t:\033[00m\33[01;32m${FECHA}\033[00m\n"
printf '\033[00;32m'"%s   USERNAME\t:\033[00m\033[01;32m$(echo $USER)\033[00m\n"
printf '\033[00;32m'"%s   HOSTNAME\t:\033[00m\033[01;32m$(hostname -f)\033[00m\n" 
printf '\033[00;32m'"%s   FECHA\t:\033[00m\033[01;32m$(date -R)\033[00m\n"
printf '\033[00;32m'"%s   SYSTEMA\t:\033[00m\033[01;32m$(awk -F= '/^PRETTY_NAME/{gsub("\"",""); print $2}' /etc/os-release)\033[00m\n"
printf '\033[00;32m'"%s   CPU\t\t:\033[00m\033[01;32m$(echo $(awk -F: '/model name/{print $2}' /proc/cpuinfo | head -1))\033[00m\n"
printf '\033[00;32m'"%s   KERNEL\t:\033[01;32m$(uname -rms)\033[00m\n"
printf '\033[00;32m'"%s   UPTIME\t:\033[01;32m$(uptime -p)\033[00m\n"
printf '\033[00;32m'"%s   PACKAGES\t:\033[01;32m$(dpkg --get-selections | wc -l)\033[00m\n" 
#printf '\033[00;32m'"%s   RESOLUTION\t:\033[01;32m$(xrandr | awk '/\*/{printf $1" "}')\033[00m\n"
printf '\033[00;32m'"%s   MEMORY\t:\033[01;32m$(free -m -h | awk '/Mem/{print $3"/"$2}')\033[00m\n" 
printf '\033[00;32m'"%s   IP ADDRESS\t:\033[01;32m${MY_IP}\033[00m\n";
printf '\033[00;32m'"%s   GATEWAY\t:\033[01;32m$(ip r | awk '/default/{print $3}' | uniq)\033[00m\n" 
#printf '\033[00;32m'"%s   DNS SERVERS\t:\033[01;32m$(systemd-resolve --status | awk -F: '/DNS Servers/{printf $2}')\033[00m\n"
printf "\n"
echo '-------------------------------------------------------------------------------'

##tmuxifier
#export PATH="$HOME/.tmuxifier/bin:$PATH"
#eval "$(tmuxifier init -)"

##Editor
#export EDITOR=nvim

##
PATH=$PATH:/usr/sbin:/sbin
