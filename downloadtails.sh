#!/bin/bash
fingerprint="A490D0F4D311A4153E2BB7CADBB802B258ACD84F"
checksig(){
    local file=$1 out=
    if out=$(gpg --status-fd 1 --verify "$file" 2>/dev/null) &&
     echo "$out" | grep -qs "$fingerprint "; then
      return 0
    else
     echo "$out" >&2
     return 1
    fi
}

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
cp ../sigs/$LATEST.sig .
if [ ! -e $LATEST ]; then
    echo "downloading tails"
    wget -O $LATEST -q --show-progress $MIRROR/stable/$(echo $LATEST | sed "s/.iso//g")/$LATEST
else
    echo "latest is already downloaded"
fi
if checksig $LATEST.sig; then 
    echo "signature good"
else
    echo "signature bad"
fi
