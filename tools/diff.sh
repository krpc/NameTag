#!/bin/bash

# Diff the code against KOS to see if anything has changed

KOS_DIR=../KOS

echo "---- NameTag.cs"
diff $KOS_DIR/src/kOS/Module/KOSNameTag.cs src/NameTag.cs | diff tools/diff-expected/NameTag.cs.diff -
echo "---- Window.cs"
diff $KOS_DIR/src/kOS/Screen/KOSNameTagWindow.cs src/Window.cs | diff tools/diff-expected/Window.cs.diff -
echo "---- Career.cs"
diff $KOS_DIR/src/kOS/Suffixed/Career.cs src/Career.cs | diff tools/diff-expected/Career.cs.diff -
echo "---- Utils.cs"
diff $KOS_DIR/src/kOS/Utilities/Utils.cs src/Utils.cs | diff tools/diff-expected/Utils.cs.diff -
