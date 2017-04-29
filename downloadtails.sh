#!/bin/bash
echo "checking to see if we have the latest version of tails"
WORKINGDIR=$(dirname $0)
echo "downloading mirror list"
MIRROR=$(curl -s https://git-tails.immerda.ch/mirror-pool/plain/mirrors.json | grep url_prefix | sed -e "s/\"url_prefix\"\: //g" -e "s/[\",]//g" | shuf -n 1 2>/dev/zero) 
cd $WORKINGDIR
cd sigs
rm *
echo "downloading sigs"
wget -q -r -nH -nd -np --reject="index.html*" https://tails.boum.org/torrents/files/
LATEST=$(ls -1 | grep .sig | grep -v \~ | sed -e "s/\.sig//g")
echo $LATEST is the latest verson
cd - 
cd iso
if [ ! -e $LATEST ]; then
    echo "downloading tails"
    wget -O $LATEST -q --show-progress $MIRROR/stable/$(echo $LATEST | sed "s/.iso//g")/$LATEST
else
    echo "latest is already downloaded"
fi
