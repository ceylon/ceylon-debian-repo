#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Usage: $0 <version>"
    echo ""
    echo "eg: $0 1.2.1"
    exit
fi

VERSION=$1

VS=(${VERSION//\./ })
if [[ ${#VS[@]} != 3 ]]; then
    echo "Error: version must have 3 numbers separated by periods, eg 1.2.1"
    exit
fi

PRIO=$(printf "%d%02d%02d0" ${VS[0]} ${VS[1]} ${VS[2]})

echo "Using version $VERSION and priority $PRIO..."
exit

git checkout -q -b "${VERSION}"

git mv dist-pkg/debian/ceylon-VERSION.postinst dist-pkg/debian/ceylon-${VERSION}.postinst 
git mv dist-pkg/debian/ceylon-VERSION.prerm dist-pkg/debian/ceylon-${VERSION}.prerm 

sed -i -- "s/@@VERSION@@/${VERSION}/g" dist-pkg/debian/*
sed -i -- "s/@@VERSIONPRIO@@/${PRIO}/g" dist-pkg/debian/*

git status

