#!/bin/bash

OG=20

while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A01; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A02; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A03; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A04; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A05; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A06; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A07; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A08; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A09; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A10; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A11; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A12; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A13; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A14; done > /dev/null &
while :; do sleep $(random_simple $OG); ./set_background_picture.sh -r -e NTB008A15; done > /dev/null

#trap EXIT kill %{1..16}
read i
kill %{1..16}
