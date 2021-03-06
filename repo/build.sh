#!/bin/sh

DEBS="ceylon-0.1_0.1_all.deb"
DEBS="$DEBS ceylon-0.2_0.2_all.deb"
DEBS="$DEBS ceylon-0.3_0.3_all.deb"
DEBS="$DEBS ceylon-0.3.1_0.3.1_all.deb"
DEBS="$DEBS ceylon-0.4_0.4_all.deb"
DEBS="$DEBS ceylon-0.5_0.5_all.deb"
DEBS="$DEBS ceylon-0.6_0.6_all.deb"
DEBS="$DEBS ceylon-1.0.0_1.0.0_all.deb"
DEBS="$DEBS ceylon-1.1.0_1.1.0_all.deb"
DEBS="$DEBS ceylon-1.2.0_1.2.0_all.deb"
DEBS="$DEBS ceylon-1.2.1_1.2.1_all.deb"
DEBS="$DEBS ceylon-1.2.2_1.2.2_all.deb"
DEBS="$DEBS ceylon-1.3.0_1.3.0_all.deb"
DEBS="$DEBS ceylon-1.3.1_1.3.1-1_all.deb"
DEBS="$DEBS ceylon-1.3.2_1.3.2-0_all.deb"
DEBS="$DEBS ceylon-1.3.3_1.3.3-0_all.deb"
# @NEW_VERSION@

rm -rf db pool dists

for deb in $DEBS
do
 if test -f $deb
 then
  echo "Not downloading $deb: already there"
 else
  wget http://downloads.ceylon-lang.org/cli/$deb
 fi
done

reprepro --confdir $(dirname $0)/conf includedeb unstable $DEBS
