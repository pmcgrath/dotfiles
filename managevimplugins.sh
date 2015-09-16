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

	# See the following for "" issue http://stackoverflow.com/questions/9777564/git-subtree-pull-complications/10698924#10698924
	# Also every time there is a change it looks like you will need a commit - even if there appaears to be no difference - use: git diff-index HEAD
	update_branch=upd-vim-plugin
	git checkout -b $update_branch	
	
	# Pathogen
	curl -LSso _vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
        [ "$(git diff-index HEAD)" != "" ] && git add . 
	
	# Plugins
	# Based on http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
	git subtree pull --prefix _vim/bundle/nerdtree https://github.com/scrooloose/nerdtree.git master --squash
	git subtree pull --prefix _vim/bundle/vim-go https://github.com/fatih/vim-go.git master --squash

	git add .
	git commit -m 'Updated vim plugins'

	echo 'Updated vim plugins, will remain on the update branch, you should complete with the following if any changes made'
	echo -e "\tgit diff master --name-only"
	echo -e "\tgit checkout master"
	echo -e "\tgit merge $update_branch"
	echo -e "\tgit branch -d $update_branch"
}
