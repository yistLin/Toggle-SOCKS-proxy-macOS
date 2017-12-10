#!/bin/bash

NET_INTERFACE="Wi-Fi"  # network interface
DEFAULT_PORT=9999  # default SOCKS proxy port

# help message
function help_msg {
    echo "usage: ./toggle_socks_proxy.sh [PORT]"
    echo ""
    echo "PORT must be in range 1024-49151"
    echo "if PORT is not given, default value $DEFAULT_PORT will be used."
    exit
}

# get command-line argument
case $# in
0)
    port="$DEFAULT_PORT"
    ;;
1)
    if [[ $1 =~ '^[0-9]+$' ]]; then
        port="$1"
    else
        help_msg
    fi
    ;;
*)
    help_msg
    ;;
esac

# get current SOCKS proxy state, and toggle it
stat=`networksetup -getsocksfirewallproxy Wi-Fi | grep "^Enabled" | cut -d " " -f2`
case $stat in
No)
    networksetup -setsocksfirewallproxy "$NET_INTERFACE" localhost $port
    echo "Turn SOCKS proxy on, through localhost:$port"
    ;;
Yes)
    networksetup -setsocksfirewallproxystate "$NET_INTERFACE" off
    echo "Turn SOCKS proxy off"
    ;;
esac

