# dot files
See [github](https://dotfiles.github.io/) for options on creating dot files, this is very simple which is all that I need at this time


## Installation
- Use the install.sh script
- I simply create symlinks
- If the content already exists, this script makes no change it just echos a message indicating content already exists


## vim
- I'm using pathogen to manage my plugins
- I have commited my vim plugins using subtrees (See [altlasian blog](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/))
- The managevimplugins.sh script can be used to update plugins
