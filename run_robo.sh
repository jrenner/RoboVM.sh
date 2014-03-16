#!/bin/bash

######
# TODO:
# - IPA Creation
######

VERSION="v0.2"

ROBO="$HOME/robovm" # RoboVM installed here
ROBO_LIBS="$ROBO/lib"
PROJECT="$HOME/projects/Robokot"
IOS_LIBS="$PROJECT/lib/ios" # libgdx's iOS libs (.a files)
OUT="$PROJECT/out/production" # compiled Java .class files

# Kotlin and libgdx libraries
LIBS_CP="$PROJECT/lib/gdx.jar:$PROJECT/lib/gdx-backend-robovm.jar:$PROJECT/lib/kotlin-runtime.jar"
# RoboVM libraries
ROBO_CP="$ROBO_LIBS/robovm-rt.jar:$ROBO_LIBS/robovm-objc.jar:$ROBO_LIBS/robovm-cocoatouch.jar:$OUT"

# External libraries (.a files)
EXT_LIBS="$IOS_LIBS/libgdx.a:$IOS_LIBS/libObjectAL.a"

echo "RoboVM.sh $VERSION - github.com/jrenner/RoboVM.sh"

# platform to build for
ARCH="thumbv7"
TARGET_OS="ios"

# Info.plist.xml file for iOS
PLIST=$PROJECT/Info.plist.xml
# Define certain RoboVM attributes from xml file
CONFIG=$PROJECT/robovm.xml

# settings read from PLIST and CONFIG will be overridden by
# command line args given after them

STARTER_CLASS=robotkot.RoboVMStarter

$ROBO/bin/robovm -verbose -config $CONFIG -plist $PLIST -arch $ARCH -os $TARGET_OS -cp $ROBO_CP:$LIBS_CP -libs $EXT_LIBS -run $STARTER_CLASS