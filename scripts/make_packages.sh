#!/bin/bash

set -e

cd "$(dirname -- "${BASH_SOURCE[0]}")/.." || exit

# Update the VERSION file to change version information
VERSION="$(cat VERSION)"
declare VERSION

# Build 7z package
git ls-tree -r --name-only HEAD | grep -e .dzn -e .mzn -e .md -e .json -e .bib -e .png -e .svg -e LICENSE -e VERSION > filelist
rm -f "MPMMine-v$VERSION.7z"
LC_ALL=C 7zz a -m0=lzma2 -mmt16 -mx9 -mfb=273 -md=256M -ms=8G -slp -sse -ssp -y "MPMMine-v$VERSION.7z" @filelist
rm filelist

# Build SQLite-zstd package
python3 -m mpmmine.sqlite_backend -t -c zstd . "MPMMine-zstd-v$VERSION.sqlite"

# Build SQLite package and compress
python3 -m mpmmine.sqlite_backend -t . "MPMMine-v$VERSION.sqlite"
xz -k --lzma2=preset=9e,dict=512MiB,nice=273,depth=1000 "MPMMine-v$VERSION.sqlite"

