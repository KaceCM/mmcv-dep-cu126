# === CONFIG RELEASE ===
RELEASE_TAG="v0.1"
RELEASE_TITLE="mmcv-dep-cu126_$RELEASE_TAG"
RELEASE_NOTES="Bundle release containing precompiled MMCV, MMDET, MMSEG dependencies for CUDA 12.6."
REPO="KaceCM/mmcv-dep-cu126"
DIST_DIR="dist"

# === TAR ALL FILES TOGETHER ===
echo "Creating global archive of all dependencies..."
cd "$DIST_DIR"
tar -czf "mmcv-dep-cu126.tar.gz" *.tar.gz
cd ..

# === CREATE GITHUB RELEASE WITH gh CLI ===
echo "Publishing $RELEASE_TAG to GitHub..."
gh release create "$RELEASE_TAG" "$DIST_DIR/mmcv-dep-cu126.tar.gz" \
  --repo "$REPO" \
  --title "$RELEASE_TITLE" \
  --notes "$RELEASE_NOTES"

echo "Release $RELEASE_TAG created successfully!"
echo "https://github.com/$REPO/releases/tag/$RELEASE_TAG"
