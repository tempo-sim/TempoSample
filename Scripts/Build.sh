#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT=$(realpath "$SCRIPT_DIR/..")
cd $PROJECT_ROOT
PROJECT_NAME=$(find . -name "*.uproject" -exec basename {} .uproject \;)

# Check for UNREAL_ENGINE_PATH
if [ -z ${UNREAL_ENGINE_PATH+x} ]; then
  echo "Please set UNREAL_ENGINE_PATH environment variable and re-run";
  exit 1
fi

PLATFORM=""
if [[ "$OSTYPE" = "msys" ]]; then
  PLATFORM="Win64"
elif [[ "$OSTYPE" = "darwin"* ]]; then
  PLATFORM="Mac"
elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
  PLATFORM="Linux"
else
  echo "Unsupported platform"
  exit 1
fi

cd "$UNREAL_ENGINE_PATH"
if [ "$PLATFORM" = "Win64" ]; then
  # Windows build script is a little different
  ./Engine/Build/BatchFiles/Build.bat "${PROJECT_NAME}Editor" Development $PLATFORM -Project="$PROJECT_ROOT/$PROJECT_NAME.uproject" -WaitMutex -FromMsBuild
else
  ./Engine/Build/BatchFiles/$PLATFORM/Build.sh "${PROJECT_NAME}Editor" Development $PLATFORM -Project="$PROJECT_ROOT/$PROJECT_NAME.uproject" -buildscw
fi