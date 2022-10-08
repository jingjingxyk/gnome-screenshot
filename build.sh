#!/bin/bash
set -exu

__DIR__=$(
  cd "$(dirname "$0")"
  pwd
)
cd ${__DIR__}


set -uex
test -d build &&  rm -rf build
meson build
cd build
ninja

cd ${__DIR__}
ls -lh
build/src/gnome-screenshot -i

# gdb --directory ${__DIR__} --args build/src/gnome-screenshot  '-i'