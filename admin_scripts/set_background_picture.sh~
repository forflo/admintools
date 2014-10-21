#!/bin/bash
#Autor: Florian Mayer
#Datum: 9.Sept.2013
#Zweck: Ändert das Hintergrundbild des Benutzers betrisys
#
#$1: Pfad zu einem Bild
#$2: Optinaler regex, der als Argument an dcmd weitergegeben wird
####

. $BASH_LIB/funktionen/aa_term_colors.sh
. $BASH_LIB/funktionen/aa_random.sh

prompt_func=no_prompt

PIC_URI="file:///usr/share/backgrounds/Speaker_Weave_by_Phil_Jackson.jpg"
STR="f:re:"
REGEX="NTB008[Aa]"
RAND="false"



help(){
cat <<EOF
usage: $0 	[[-f <file>] | [-r ]]
					[-e <regex>] 

	r := use a random picture from path
EOF
}

print_help(){
	help | flog 2 
}

if [ "$1" = "--help" -o $# = 0 ]; then
	print_help
	exit 0
fi

while getopts $STR input; do
	case $input in 
		(f) PIC_URI="$OPTARG" ;;
		(e) REGEX="$OPTARG" ;;
		(r) RAND="true" ;;
	esac
done
echo "$STR $REGEX $RAND $PIC_URI"

 
flog 2  Setting backgrounds!
if [ "$RAND" = false ]; then
	dcmd -r "$REGEX" -u betrisys -sq export DISPLAY=:0\; gsettings set org.gnome.desktop.background picture-uri $PIC_URI
else 
	flog 3 Random mode is used ...
	PIC_URI=file:///usr/share/backgrounds/"$(random_file /usr/share/backgrounds/)"
	flog 3 Filename is: ${PIC_URI}
	dcmd -r "$REGEX" -u betrisys -sq export DISPLAY=:0\; gsettings set org.gnome.desktop.background picture-uri "$PIC_URI"
fi

