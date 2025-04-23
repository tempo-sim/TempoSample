#!/usr/bin/env bash

set -e

if [ -z "$1" ]
  then
    echo "Pass new project name as an argument"
    exit
fi

case "$(uname)" in
  Darwin*) # macOS
    # Mac uses BSD sed, which requires a "" after the insert command
    sed_i=(-i "")
    ;;
  *) # Linux and Git Bash on Windows
    sed_i=(-i)
    ;;
esac

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT=$(realpath "$SCRIPT_DIR/..")
cd "$PROJECT_ROOT"
OLD_NAME=$(find . -maxdepth 1 -name "*.uproject" -exec basename {} .uproject \;)

NEW_NAME="$1"

# uproject file
mv "$OLD_NAME.uproject" "$NEW_NAME.uproject"
sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g" "$NEW_NAME.uproject"

cd Source

# Target.cs files
mv "$OLD_NAME.Target.cs" "$NEW_NAME.Target.cs"
mv "${OLD_NAME}Editor.Target.cs" "${NEW_NAME}Editor.Target.cs"
sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g" "$NEW_NAME.Target.cs"
sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g" "${NEW_NAME}Editor.Target.cs"

# Module folder
mv "$OLD_NAME" "$NEW_NAME"
cd "$NEW_NAME"

# Build.cs
mv "$OLD_NAME.Build.cs" "$NEW_NAME.Build.cs"
sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g" "$NEW_NAME.Build.cs"

# Module Source
mv "Public/$OLD_NAME.h" "Public/$NEW_NAME.h"
mv "Private/$OLD_NAME.cpp" "Private/$NEW_NAME.cpp"
mv "Public/${OLD_NAME}GameMode.h" "Public/${NEW_NAME}GameMode.h"
mv "Private/${OLD_NAME}GameMode.cpp" "Private/${NEW_NAME}GameMode.cpp"

OLD_NAME_CAPS=$(echo "$OLD_NAME" | tr '[:lower:]' '[:upper:]')
NEW_NAME_CAPS=$(echo "$NEW_NAME" | tr '[:lower:]' '[:upper:]')

find . -type f -name "*.h" -print0 | xargs -0 sed "${sed_i[@]}" "s/${OLD_NAME_CAPS}_API/${NEW_NAME_CAPS}_API/g"
find . -type f -name "*.h" -print0 | xargs -0 sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g"
find . -type f -name "*.cpp" -print0 | xargs -0 sed "${sed_i[@]}" "s/$OLD_NAME/$NEW_NAME/g"

REDIRECT_TEMPLATE=\
'
[CoreRedirects]
+ClassRedirects=(OldName="/Script/TempoSample.TempoSampleGameMode",NewName="/Script/__NEW_NAME__.__NEW_NAME__GameMode")'
REDIRECT=${REDIRECT_TEMPLATE//__NEW_NAME__/$NEW_NAME}

# Remove any existing redirects and add the new one
TEMP_FILE=$(mktemp)
sed '/\[CoreRedirects\]/,$d' "$PROJECT_ROOT/Config/DefaultEngine.ini" > "$TEMP_FILE"
echo -e "$REDIRECT" >> "$TEMP_FILE"

cp "$TEMP_FILE" "$PROJECT_ROOT/Config/DefaultEngine.ini"
