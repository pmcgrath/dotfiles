" *** Resources
" http://learnvimscriptthehardway.stevelosh.com/
" http://obahua.com/setup-vim-for-go-development/
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" Can reload after altering this file with :source %



" *** General
" Can see help for settings with :help settingname
" Can see the current value for a particular setting like so :set path?
filetype plugin on                          " Enable filetype plugins
let mapleader=" "                           " Leader key
set nocompatible                            " Use vim settings, rather then vi settings - This must be first, because it changes other options as a side effect
set backspace=2                             " Deal with backspace issues on windows (See http://vim.wikia.com/wiki/Backspace_and_delete_problems)
set clipboard=unnamedplus,unnamed           " Share system clipboard - X window, added unnamed to cater for MS Windows based git (See http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default)
set noerrorbells visualbell t_vb=           " Disable the annoying beep, see http://vim.wikia.com/wiki/Disable_beeping
set nowrap                                  " Disable line wrapping
set number                                  " Display line numbers
set shiftwidth=0 softtabstop=4 tabstop=4    " Indent when using >, lets set to 0 so it matches the
set ignorecase smartcase                    " Case insenstive searching until you use a capital letter
syntax on                                   " Ensure syntax is on



" **** Command to remove trailing spaces - mapped to t - See http://vim.wikia.com/wiki/Remove_unwanted_spaces
:nnoremap <silent> t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" **** Allow vertical pane resizing
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
" ***** Allow switching panes a little easier, see https://vi.stackexchange.com/questions/3728/how-can-i-work-with-splits-in-vim-without-ctrl-w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l



" *** Plugins
" See https://github.com/junegunn/vim-plug
"     https://opensource.com/article/20/2/how-install-vim-plugins
" Will need to run :PlugInstall or :PlugUpdate
call plug#begin('~/.vim/plugged')
" See https://github.com/ctrlpvim/ctrlp.vim - use HEAD as not many releases
Plug 'ctrlpvim/ctrlp.vim'
" See https://github.com/fatih/vim-go/tags
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.28' }
" See https://github.com/preservim/nerdtree/tags
Plug 'preservim/nerdtree', { 'tag': '7.1.3' }
call plug#end()



" *** NERDTree plugin
" Possibly use native file explorer rather than using NERDTree plugin - See https://medium.com/@mozhuuuuu/vimmers-you-dont-need-nerdtree-18f627b561c3
autocmd VimEnter * NERDTree | wincmd p      " Open NERDTree when vim opened, cursor on pane to right - see https://github.com/preservim/nerdtree?tab=readme-ov-file#how-do-i-open-nerdtree-automatically-when-vim-starts
nmap z :NERDTreeToggle<CR>                  " Map z to toggle nerdtree on/off
let NERDTreeShowHidden=1                    " Show hidden files, can toggle with shift-i, see https://stackoverflow.com/questions/5057359/how-can-i-show-hidden-files-starting-with-period-in-nerdtree



" *** ctrlp plugin
let g:ctrlp_cmd = 'CtrlP'



" *** vim-go plugin
" Run :GoUpdateBinaries to ensure all the required go tools are available - will install all tools listed at the top of https://github.com/fatih/vim-go/blob/master/plugin/go.vi://github.com/fatih/vim-go/blob/master/plugin/go.vim
" Sometimes have to disable this as is too expensive - scans all sources on gopath - use a SSD to solve this, see http://unix.stackexchange.com/questions/65595/how-to-know-if-a-disk-is-an-ssd-or-an-hdd
let g:go_fmt_command = "goimports"    " Use goimports on save (goimports calls gofmt anyway)
