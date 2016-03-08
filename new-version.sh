#!/bin/bash

if [[ $# != 2 ]]; then
    echo "Usage: $0 <version> <version-prio>"
    echo ""
    echo "eg: $0 1.2.1 12010"
    exit
fi

VERSION=$1
PRIO=$2

git checkout -q -b "${VERSION}"

git mv dist-pkg/debian/ceylon-VERSION.postinst dist-pkg/debian/ceylon-${VERSION}.postinst 
git mv dist-pkg/debian/ceylon-VERSION.prerm dist-pkg/debian/ceylon-${VERSION}.prerm 

sed -i -- "s/@@VERSION@@/${VERSION}/g" dist-pkg/debian/*
sed -i -- "s/@@VERSIONPRIO@@/${PRIO}/g" dist-pkg/debian/*

git status

