#!/bin/bash

set -e

GAMEDATA=${KSP_DIR:-lib/ksp}/GameData/NameTag
VERSION=`tools/version.sh`

make

rm -rf $GAMEDATA
cp -R GameData/NameTag $GAMEDATA

find $GAMEDATA -type f -exec chmod 644 {} \;
find $GAMEDATA -type d -exec chmod 755 {} \;

ls -lR $GAMEDATA
