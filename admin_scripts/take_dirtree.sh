#Author: Florian Mayer
#Date: 29.Sept.2013
#Summary: 
# Acquires all given Folders from the specified remote computer. The list of folders has to
# be a comma separated list of values where no space between values and commas is allowed!
##

DEST_PATH=/home/florian/klingon/lab_root_ubuntu/
FILES_PATHS="home/betrisys,root,boot,etc" #comma separated
REMOTE="root@ntb008a01.inf.fh-rosenheim.de"

debug(){
	echo dest: $DEST_PATH, remote: $REMOTE, paths: $FILES_PATHS
}

usage(){
	cat << EOF
usage $0 [ -f <paths and files>] [ -r <remote machine> ] [ -d <destination path> ]
    paths have to be comma separated without spaces between commas
    defaults:
        -f = $FILES_PATHS
        -r = $REMOTE
        -d = $DEST_PATH
EOF
}

if [[ "$1" == --[hH][eE][lL][pP] ]]; then
	usage
	exit 0
fi

OPTSTR="d:f:r:"
while getopts $OPTSTR input; do
	case $input in
		(d)	if [ "$OPTARG" = "/" ]; then
				echo Das ist keine gute Idee!
				exit 1
			fi 
			DEST_PATH="$OPTARG"
			;;
		(f) FILES_PATHS="$OPTARG"
			;;
		(r) REMOTE="$OPTARG"
			;;
		(*)
			usage
			;;
	esac
done

#Eval is needed for brace expansion
eval sudo rsync -avR ${REMOTE}:/{$FILES_PATHS} $DEST_PATH
#Deletion of individual configuration data like networking informations
sudo rm -rf $DEST_PATH/etc/{network,hostname,NetworkManager}
sudo rm $DEST_PATH/boot/grub/grub.cfg
