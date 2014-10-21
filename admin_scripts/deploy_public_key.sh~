#!/bin/bash
#Autor: Florian Mayer
#Datum: 9.Sept.2013
#Zweck: Verteilt einen öffentlichen Schlüssel
#	auf Laborrechnern des Raums B008A
#
#$1: 	Schlüsseldatei
#$2: 	Zielpfad
##

. $BASH_LIB/funktionen/aa_term_colors.sh

MOD=750
USER=penelope

if [[ ! -f "$1" || -z "$2" ]]; then
	clog 1 Bitte geben Sie die Schlüsseldatei und den Zielpfad an!
	exit 1
fi

COMMAND=$(cat <<EOF
[ ! -d "$2" ] && \
mkdir "$2" && \
chown -R $USER:$USER "$2" && \
chmod -R 750 "$2"
EOF
)

clog 2 Ausführen von: $COMMAND
dcmd -u root -q -r 'NTB008[Aa]' "$COMMAND"
clog 2 Kopieren des Schlüssels
dcopy -u root -q -r 'NTB008[Aa]' "$1" "$2"/authorized_keys
clog 2 Setzen der Rechte
dcmd -u root  -q -r 'NTB008[Aa]' chown $USER:$USER "$2"/authorized_keys \; chmod $MOD "$2"/authorized_keys
