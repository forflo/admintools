#!/bin/bash
#Autor: Florian Mayer
#Datum: 30.Sept.2013
#Zweck: Synchronisiert einen vorher mit take_dirtree geholten Verzeichnisbaum 
#		mit einem Verzeichnisbaum einer Remotemaschine
#Anmerkungen: Das sudo vor rsync ist notwendig, weil die dir trees unter als Superuser erstellt werden mussten
##

REMOTE="ntb008a01.inf.fh-rosenheim.de"
DIR_TREE="/home/florian/klingon/lab_root_ubuntu/"
DEST_TREE=/

debug(){
	echo dest: $DEST_TREE, remote: $REMOTE, dir: $DIR_TREE
}

usage(){
	cat << EOF
usage $0 [ -s <source dir tree>] [ -r <remote machine> ] [ -d <destination path> ]
    paths have to be comma separated without spaces between commas
    defaults:
        -s := $DIR_TREE
        -r := $REMOTE
        -d := $DEST_TREE
        -h := this help
EOF
	exit 0
}

if [[ "$1" == --[hH][eE][lL][pP] ]]; then
	usage
elif [ $# -eq 0 ]; then
	usage 
fi

OPTSTR="d:s:r:"
while getopts $OPTSTR input; do
	case $input in
		(d) DEST_TREE="$OPTARG"
			;;
		(s) DIR_TREE="$OPTARG"
			;;
		(r) REMOTE="$OPTARG"
			;;
		(h) 
			usage
			;;
		(*)
			usage
			;;
	esac
done

##
#Set some environment variables through options for sudo, 
#otherwise rsync would not work as expected 
##
sudo SSH_AUTH_SOCK=$SSH_AUTH_SOCK SSH_AGENT_PID=$SSH_AGENT_PID rsync --verbose --recursive --relative --links --perms --owner --group ${DIR_TREE}/./ root@${REMOTE}:${DEST_TREE}
