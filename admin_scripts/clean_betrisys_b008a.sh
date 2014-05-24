#!/bin/bash
#Autor: Florian Mayer
#Datum: 8.Sept.2013
#Zweck: Plättet den Benutzerordner von betrisys und
#	spielt Ursprungsdaten auf.
###

. $BASH_LIB/funktionen/aa_term_colors.sh

if [ ! -d "$1" ]; then
	clog 1 Bitte geben Sie einen gültigen Ordner als Parameter an!
	exit 1
fi

dcmd -u root -r 'NTB008[Aa]'  rm -rf /home/betrisys \; echo done
sleep 20
dcopy -u root -r 'NTB008[Aa]' "$1" /home/
sleep 20
dcmd -u root -q -r 'NTB008[Aa]' cd /home/ \; chown -R betrisys:betrisys betrisys \; chmod -R 750 betrisys 
