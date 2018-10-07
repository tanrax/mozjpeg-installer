#!/bin/bash
set -e

# Tools install
sudo apt-get install -y autoconf automake libtool nasm make pkg-config git libpng-dev

# Get code
git clone https://github.com/mozilla/mozjpeg.git --depth 1

# Build
cd mozjpeg
autoreconf -fiv
./configure
make -j8

# Install
sudo make install

# Path
sudo ln -s /opt/mozjpeg/bin/jpegtran /usr/bin/mozjpeg

# Remove old files
cd ..
sudo rm -r mozjpeg

# Alert
echo 'Finish! Try "mozjpeg --help"'
