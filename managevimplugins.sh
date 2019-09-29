#!/usr/bin/env bash

source_directory_path=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

setup-vim-plugins() {
	cd $source_directory_path

	# Based on http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
	git subtree add --prefix _vim/pack/plugins/start/ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim master --squash
	git subtree add --prefix _vim/pack/plugins/start/nerdtree https://github.com/scrooloose/nerdtree.git master --squash
	git subtree add --prefix _vim/pack/plugins/start/vim-go https://github.com/fatih/vim-go.git master --squash
}

update-vim-plugins() {
	cd $source_directory_path

	# This is still pending but you can just run the commands and do commits between updates !!!

	# See the following for "working tree has modifications.  Cannot add." issue - http://stackoverflow.com/questions/9777564/git-subtree-pull-complications/10698924#10698924
	# Also every time there is a change it looks like you will need a commit - even if there appaears to be no difference - use: git diff-index HEAD
	local -r update_branch=upd-vim-plugin
	git checkout -b $update_branch	

	# Based on http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/
	git subtree pull --prefix _vim/pack/plugins/start/ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim master --squash
	git subtree pull --prefix _vim/pack/plugins/start/nerdtree https://github.com/scrooloose/nerdtree.git master --squash
	git subtree pull --prefix _vim/pack/plugins/start/vim-go https://github.com/fatih/vim-go.git master --squash

	git add .
	git commit -m 'Updated vim plugins'

	echo 'Updated vim plugins, will remain on the update branch, you should complete with the following if any changes made'
	echo -e "\tgit diff master --name-only"
	echo -e "\tgit checkout master"
	echo -e "\tgit merge $update_branch"
	echo -e "\tgit branch -d $update_branch"
	echo -e "\tgit push origin master"
}
