#!/bin/bash

######
# TODO:
# - IPA Creation
######

VERSION="v0.3"

ROBO="$HOME/robovm" # The locaiton you installed/extractd RoboVM
ROBO_LIBS="$ROBO/lib"
PROJECT="$HOME/projects/Robokot" # your app's directory
IOS_LIBS="$PROJECT/lib/ios" # libgdx's iOS libs (.a files)
OUT="$PROJECT/out/production/Robokot" # compiled Java .class files from your project should be here

# Kotlin and libgdx libraries (any misc jars your project needs go here)
LIBS_CP="$PROJECT/lib/gdx.jar:$PROJECT/lib/gdx-backend-robovm.jar:$PROJECT/lib/kotlin-runtime.jar"
# RoboVM libraries (essential robovm jars)
ROBO_CP="$ROBO_LIBS/robovm-rt.jar:$ROBO_LIBS/robovm-objc.jar:$ROBO_LIBS/robovm-cocoatouch.jar:$OUT"

# External libraries (.a files) iOS needs these external libraries
EXT_LIBS="$IOS_LIBS/libgdx.a:$IOS_LIBS/libObjectAL.a"

echo "RoboVM.sh $VERSION - github.com/jrenner/RoboVM.sh"

# platform to build for
ARCH="thumbv7" # could be x86 or thumbv7, thumbv7 is ARM (mobile devices like iPhone)
TARGET_OS="ios" # roboVM can also build for mac or linux

# Info.plist.xml file for iOS
PLIST=$PROJECT/Info.plist.xml
# Define certain RoboVM attributes from xml file
CONFIG=$PROJECT/robovm.xml

# settings read from PLIST and CONFIG will be overridden by
# command line args given after them

# the launching class for your application, i.e. com.example.IOSAppStarter
STARTER_CLASS=robokot.RoboVMStarter

$ROBO/bin/robovm -verbose -config $CONFIG -plist $PLIST -arch $ARCH -os $TARGET_OS -cp $ROBO_CP:$LIBS_CP -libs $EXT_LIBS -run $STARTER_CLASS
