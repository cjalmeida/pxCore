#!/bin/sh

pxSceneDir=../..
jsbindingsDir=$pxSceneDir/src/jsbindings

echo "Start"
echo "pxSceneDir=" $pxSceneDir
echo "jsbindingsDir=" $jsbindingsDir
echo "\n"

export DYLD_LIBRARY_PATH=$pxSceneDir/external/png/.libs/:$pxSceneDir/external/curl/lib/.libs/:$pxSceneDir/external/ft/objs/.libs/
export LD_LIBRARY_PATH=$pxSceneDir/external/png/.libs/:$pxSceneDir/external/jpg/.libs/:$pxSceneDir/external/curl/lib/.libs/:../../external/libnode/out/Release/obj.target

[ -f FontdinerSwanky.ttf ] || cp $pxSceneDir/src/FontdinerSwanky.ttf .
[ -f FreeSans.ttf ] || cp $pxSceneDir/src/FreeSans.ttf .

export NODE_PATH=$NODE_PATH:`pwd`

#../rtNode $1

if [ "$#" -ne 1 ]; then
echo here....
   ../rtNode "./start.js"
else
   ../rtNode $1
fi

##gdb --args ../rtNode start.js url=$*
#node start.js url=$*
