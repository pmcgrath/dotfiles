#!/usr/bin/env bash

source_directory_path=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

setup-vim-plugins() {
	cd $source_directory_path

	# Pathogen
	mkdir -p _vim/autoload
	curl -LSso _vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

	# Plugins
	# Based on http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
	git subtree add --prefix _vim/bundle/nerdtree https://github.com/scrooloose/nerdtree.git master --squash
	git subtree add --prefix _vim/bundle/vim-go https://github.com/fatih/vim-go.git master --squash
}

update-vim-plugins() {
	cd $source_directory_path
	
	# Pathogen
	curl -LSso _vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	
	# Plugins
	# Based on http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
	git subtree pull --prefix _vim/bundle/nerdtree https://github.com/scrooloose/nerdtree.git master --squash
	git subtree pull --prefix _vim/bundle/vim-go https://github.com/fatih/vim-go.git master --squash
}
