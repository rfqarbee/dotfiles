#!/usr/bin/env sh

# for future rig, just run this to symlink;

if ! [ -f zshrc ]; then
ln -s .zshrc zshrc
fi
if ! [ -f zshenv ]; then
ln -s .zshenv zshenv
fi
if ! [ -f zprofile ]; then
ln -s .zprofile zprofile
fi
