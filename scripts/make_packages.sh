#!/bin/bash

declare VERSION="0.1.0.20260721"

cd "$(dirname -- "${BASH_SOURCE[0]}")/.." || exit

git ls-tree -r --name-only HEAD | grep -e .dzn -e .mzn -e .md -e .json -e .bib -e .png -e .svg -e LICENSE > filelist
rm MPMMine-v$VERSION.7z
LC_ALL=C 7zz a -m0=lzma2 -mmt16 -mx9 -mfb=273 -md=256M -ms=8G -slp -sse -ssp -y MPMMine-v$VERSION.7z @filelist

python3 -m mpmmine.sqlite_backend -t -c zstd . MPMMine-zstd-v$VERSION.sqlite

python3 -m mpmmine.sqlite_backend -t . MPMMine-v$VERSION.sqlite
xz -9ek MPMMine-v$VERSION.sqlite
