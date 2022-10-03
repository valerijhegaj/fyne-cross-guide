PROJECTNAME=hello_world

PATH_TO_LINUX_AMD64=download/linux-amd64
PATH_TO_WINDOWS_AMD64=download/windows-amd64

PATH_FROM_LINUX_AMD64=fyne-cross/dist/linux-amd64
PATH_FROM_WINDOWS_AMD64=fyne-cross/dist/windows-amd64

TEAM_ID=valerijhegaj

default: help

create-download-dir:
	mkdir -p download
	mkdir -p $(PATH_TO_LINUX_AMD64)
	mkdir -p $(PATH_TO_WINDOWS_AMD64)

build-linux-amd64:
	~/go/bin/fyne-cross linux -arch amd64 -name $(PROJECTNAME) 

build-windows-amd64:
	~/go/bin/fyne-cross windows -arch amd64 -name $(PROJECTNAME).exe

pack-linux-amd64:
	mv $(PATH_FROM_LINUX_AMD64)/$(PROJECTNAME).tar.xz $(PATH_TO_LINUX_AMD64)/$(PROJECTNAME).tar.xz

pack-windows-amd64:
	mv $(PATH_FROM_WINDOWS_AMD64)/$(PROJECTNAME).exe.zip $(PATH_TO_WINDOWS_AMD64)/$(PROJECTNAME).zip

remove-binares:
	rm -rf fyne-cross

remove-archives:
	rm -rf download

clean: remove-archives remove-binares

build: build-linux-amd64 build-windows-amd64

pack: pack-linux-amd64 pack-windows-amd64

prepare-release: create-download-dir build pack remove-binares

install:
	fyne install

help:
	@echo "make <command>\n"
	@echo "The commands are:\n"
	@echo "\tinstall                  install on your system"
	@echo "\tprepare-release          build for each os, pack, mv and clean"
	@echo "\tcreate-download-dir      create download and subdirs"
	@echo "\tpack                     pack and mv for each os"
	@echo "\tbuild                    build for each os"
	@echo "\tbuild-linux-amd64        build for linux x86-64"
	@echo "\tbuild-windows-amd64      build for windows x86-64"
	@echo "\tbuild-linux-amd64        pack and mv for linux x86-64"
	@echo "\tbuild-windows-amd64      pack and mv for windows x86-64"
	@echo "\tremove-binares           remove dir fyne-cross"
	@echo "\tremove-archives          remove dir download"
	@echo "\tclean                    clean all"

all: help
