#!/bin/bash
#Autor: Florian Mayer
#Datum: 13.Sept.2013
#Zweck: Führt ein angegebenes lokal gelegenes
#	Skript auf allen spezifizierten Rechnern aus
##

. $BASH_LIB/funktionen/aa_term_colors.sh

OPTSTR="r:u:p:qs"
print_help(){
	clog 2 "$(cat <<EOF
[ -r <regex> ]
[ -u <user> ]
[ -p <port> ]
[ -q ] -> quiet
[ -s ] -> simultaneous

<Scriptpath>

EOF
)"
}

if [ $# -eq 0 ]; then
	clog 1 There are no parameters!
	print_help
	exit 1
fi

while getopts $OPTSTR input; do
	case $input in
		(r) CMDOPTS=$CMDOPTS" -r $OPTARG " ;;
		(u) CMDOPTS=$CMDOPTS" -u $OPTARG " ;;
		(p) CMDOPTS=$CMDOPTS" -p $OPTARG " ;;
		(q) CMDOPTS=$CMDOPTS" -q " ;;
		(s) CMDOPTS=$CMDOPTS" -s " ;;
	esac
done

shift $(($OPTIND-1))
if [ ! -f "$1" ]; then
	clog 1 The given path could not be found!
	print_help
	exit 1
fi

SCRIPT=$(cat $1)

dcmd $CMDOPTS "$SCRIPT"

