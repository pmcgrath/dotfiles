#!/usr/bin/env bash
set -eou pipefail

# See https://github.com/junegunn/vim-plug/tags
# Can use local function: get-latest-github-release junegunn vim-plug
tag=0.10.0

curl -fLo ./_vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/${tag}/plug.vim

echo -e "
You should now check your plugins with
:PlugStatus

and update if you need to with
:PlugUpdate

Also check if this update needs commiting with
git status .
"
