# Fyne Cross Guide

[Fyne](https://github.com/fyne-io/fyne) is an easy-to-use UI toolkit and app API written in Go. \
[Fyne-cross](https://github.com/fyne-io/fyne-cross) is a simple tool to cross compile and create distribution packages for Fyne applications using docker images that include Linux, the MinGW compiler for Windows, FreeBSD, and a macOS SDK, along with the Fyne requirements.

## Geting Started

First of all install go, and docker (if on mac start docker) \
Download npm (on mac brew install node)

    npm install -g create- #for mac os
    git clone https://github.com/valerijhegaj/fyne-cross-guide.git
    cd fyne-cross-guide
    go mod tidy
    go get github.com/fyne-io/fyne-cross
    go install github.com/fyne-io/fyne-cross
    PATH=$PATH:~/go/bin

In first start docker download need images

### If you want to install

    go get fyne.io/fyne/v2/cmd/fyne
    go install fyne.io/fyne/v2/cmd/fyne

## Usage

    make <command>
    
    The commands are:
    
		install                  install on your system
		prepare-release          build for each os, pack, mv and clean
		create-download-dir      create download and subdirs
		pack                     pack and mv for each os
		build                    build for each os
		build-darwin-arm64       build for macos arm
		build-darwin-amd64       build for macos intel
		build-linux-amd64        build for linux x86-64
		build-windows-amd64      build for windows x86-64
		pack-darwin-arm64        pack and mv for macos arm
		pack-darwin-amd64        pack and mv for macos intel
		build-linux-amd64        pack and mv for linux x86-64
		build-windows-amd64      pack and mv for windows x86-64
		remove-binares           remove dir fyne-cross
		remove-archives          remove dir download
		clean                    clean all

### On linux write

    sudo env PATH=$PATH make <command>

## Launch

On macOS

    sudo xattr -rd com.apple.quarantine /Applications/hello_world.app
