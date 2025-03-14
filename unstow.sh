#!/usr/bin/env bash

echo "$PWD"
stow_dirs=$(find $PWD -mindepth 1 -maxdepth 1 -not -path "*/.git" -type d)

for folder in $stow_dirs; do
    currentFolder=$(basename $folder)
    echo "Removing $currentFolder"
    stow -D $currentFolder
done
