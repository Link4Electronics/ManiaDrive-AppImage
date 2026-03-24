#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    freealut
    libxml2-legacy
    libcurl-gnutls

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package libpng12

# If the application needs to be manually built that has to be done down here
if [ "$ARCH" = "x86_64" ]; then
    VERSION=1.3custom
    echo "$VERSION" > ~/version
    mkdir -p ./AppDir/bin
