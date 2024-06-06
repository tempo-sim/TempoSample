#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT=$(realpath "$SCRIPT_DIR/..")
cd $PROJECT_ROOT
PROJECT_NAME=$(find . -maxdepth 1 -name "*.uproject" -exec basename {} .uproject \;)

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
  ./Engine/Binaries/Win64/UnrealEditor-Cmd.exe "$PROJECT_ROOT/$PROJECT_NAME.uproject"
elif [ "$PLATFORM" = "Mac" ]; then
  ./Engine/Binaries/Mac/UnrealEditor.app/Contents/MacOS/UnrealEditor "$PROJECT_ROOT/$PROJECT_NAME.uproject"
elif [ "$PLATFORM" = "Linux" ]; then
  ./Engine/Binaries/Linux/UnrealEditor "$PROJECT_ROOT/PROJECT_NAME.uproject"
else
  echo "Unsupported platform"
  exit 1
fi
