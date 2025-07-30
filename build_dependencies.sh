#!/bin/bash

set -e

# === all dependencies repo ===
declare -A REPOS=(
  ["mmcv"]="KaceCM/mmcv-2.2.0-cu126"
  ["mmdet"]="KaceCM/mmdet-3.3.0-cu126"
  ["mmseg"]="KaceCM/mmseg-1.2.2-cu126"
)

DIST_DIR="dist"
mkdir -p "$DIST_DIR"

echo "Downloading latests releases :"

for NAME in "${!REPOS[@]}"; do
    REPO="${REPOS[$NAME]}"
    echo "Treating $NAME ($REPO)"

    # Get latest release tag
    TAG=$(curl -sL -o /dev/null -w "%{url_effective}" "https://github.com/$REPO/releases/latest" | awk -F'/' '{print $NF}')
    echo "Last tag : $TAG"

    # Create the download URL
    URL="https://github.com/$REPO/archive/refs/tags/$TAG.tar.gz"
    echo "URL : $URL"

    # Download the tarball
    wget -q --show-progress -O "$DIST_DIR/$NAME-$TAG.tar.gz" "$URL"
done

echo "All downloaded in '$DIST_DIR/'"
