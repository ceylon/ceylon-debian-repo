#!/bin/sh

DEST=pool/main

for deb in $@
do
 name=`basename $deb`
 pkg=${name%%_*}
 firstLetter=$(echo ${pkg} | cut -c1)
 dir="$DEST/$firstLetter/$pkg"
 echo "Copying debian file in $dir"
 mkdir -p $dir
 cp $deb $dir/
done
