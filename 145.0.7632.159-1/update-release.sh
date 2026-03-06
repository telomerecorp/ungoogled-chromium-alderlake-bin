#!/bin/bash
# Run this after each new ungoogled-chromium build to update the release files.
# Usage: ./update-release.sh /path/to/ungoogled-chromium-VERSION-x86_64.pkg.tar.zst

set -e

PKG="$1"

if [ -z "$PKG" ] || [ ! -f "$PKG" ]; then
    echo "Usage: $0 /path/to/ungoogled-chromium-VERSION-x86_64.pkg.tar.zst"
    exit 1
fi

PKG_NAME=$(basename "$PKG")
VERSION=$(echo "$PKG_NAME" | grep -oP '\d+\.\d+\.\d+\.\d+-\d+')

echo "Package : $PKG_NAME"
echo "Version : $VERSION"

# Generate sha256sum
SHA=$(sha256sum "$PKG" | awk '{print $1}')
echo "SHA256  : $SHA"

# Write sha256sums.txt
echo "$SHA  $PKG_NAME" > sha256sums.txt
echo "Written : sha256sums.txt"

# Update sha256sums in PKGBUILD
sed -i "s/sha256sums=('SKIP')/sha256sums=('$SHA')/" PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$(echo $VERSION | cut -d- -f1)/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=$(echo $VERSION | cut -d- -f2)/" PKGBUILD
echo "Updated : PKGBUILD"

# Copy package here
cp "$PKG" "./$PKG_NAME"
echo "Copied  : $PKG_NAME"

echo ""
echo "Next steps:"
echo "  1. git add . && git commit -m \"Release $VERSION\""
echo "  2. git tag $VERSION"
echo "  3. git push && git push --tags"
echo "  4. Create GitHub release and upload $PKG_NAME and sha256sums.txt"
