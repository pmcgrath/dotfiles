# dot files
See [github](https://dotfiles.github.io/) for options on creating dot files, this is very simple which is all that I need at this time

See [Jess Frazelle](https://github.com/jfrazelle)'s dot files for loads of good stuff


## Pre-commit hook
Uses https://pre-commit.com/ so if updating will need
- python
- shellcheck


## Installation
- Use the install.sh script
- I simply create symlinks
- If the content already exists, this script makes no change it just echos a message indicating content already exists


## vim
- Don't really need a plugin manager since v8+ but have went with using [vim-plug](https://github.com/junegunn/vim-plug)
  - Plugin versions are already set in the .vimrc file, so update and commit
  - Use **:PlugInstall** or **:PlugUpate** to manage the plugins
  - Use **:GoInstallBinaries** or **:GoUpdateBinaries** to manage vim-go binaries
- Can update vim-plug itself with **update-vim-plug.sh** - will need a commit after the update
