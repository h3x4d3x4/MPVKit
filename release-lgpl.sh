#!/bin/bash
# Release LGPL build artifacts to GitHub.
#
# Run after `make build platform=ios version=0.41.0-lgpl1` completes successfully.
# Requires: gh CLI authenticated on h3x4d3x4 account.

set -euo pipefail

TAG="0.41.0-lgpl1"
DIST="$(cd "$(dirname "$0")" && pwd)/dist/release"

if [ ! -d "$DIST" ]; then
    echo "❌  dist/release not found — run the build first"
    exit 1
fi

# Verify iOS xcframeworks exist
required=(Libmpv-ios.xcframework.zip Libavcodec-ios.xcframework.zip Libavformat-ios.xcframework.zip Libavutil-ios.xcframework.zip Libswresample-ios.xcframework.zip Libswscale-ios.xcframework.zip)
missing=0
for f in "${required[@]}"; do
    if [ ! -f "$DIST/$f" ]; then
        echo "❌  missing $f"
        missing=1
    fi
done
if [ $missing -ne 0 ]; then
    echo "Build incomplete — required artifacts missing"
    exit 1
fi

echo "✓  All required iOS xcframeworks present"

# Create the GitHub release (or update existing) with all xcframework zips + checksums
echo "→  Creating release $TAG on h3x4d3x4/MPVKit..."

# All zips and checksums
shopt -s nullglob
files=( "$DIST"/*.xcframework.zip "$DIST"/*.xcframework.checksum.txt )

if gh release view "$TAG" --repo h3x4d3x4/MPVKit >/dev/null 2>&1; then
    echo "→  Release $TAG already exists — uploading assets (overwriting)"
    gh release upload "$TAG" --repo h3x4d3x4/MPVKit --clobber "${files[@]}"
else
    gh release create "$TAG" \
        --repo h3x4d3x4/MPVKit \
        --title "0.41.0 LGPL build (iOS App Store)" \
        --notes "LGPL build of FFmpeg + libmpv for iOS App Store distribution. Built without --enable-gpl --enable-nonfree." \
        "${files[@]}"
fi

echo "✓  Release published: https://github.com/h3x4d3x4/MPVKit/releases/tag/$TAG"
