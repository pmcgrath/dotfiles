#!/usr/bin/env bash

make-link() {
	local -r source_path=$1
	local -r target_path=$2

	if [ -e $target_path ]; then
		resolved_target_path=$(readlink -f $target_path)
		[ $resolved_target_path != $source_path ] && echo "$target_path already exists with a different target $resolved_target_path to $source_path"
		return
	fi
	
	ln -s $source_path $target_path
}

# Store source directory path 
source_directory_path=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

# .git content
make-link $source_directory_path/_gitconfig ~/.gitconfig

# Vim content
make-link $source_directory_path/_vim ~/.vim
make-link $source_directory_path/_vimrc ~/.vimrc

