"//////////////////////////////////////////////////////////////////////////////
" .vimrc
"//////////////////////////////////////////////////////////////////////////////

" dein.vim
"=========================================================

" dein plugin folder
"---------------------------------------------------------
let s:dein_dir = expand('~/.cache/dein')

" dein.vim 本体
"---------------------------------------------------------
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" download dein.vim if necessary
"---------------------------------------------------------
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein setting
"---------------------------------------------------------
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Plugin list TOML file
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " make TOML file cached
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Install module if necessary
if dein#check_install()
  call dein#install()
endif

"=========================================================
" General setting
"=========================================================
set number
set cursorline

" character encoding
set fenc=utf-8
set encoding=utf-8

" tab setting
set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4

" search setting
set ignorecase
set smartcase
set incsearch
set wrapscan

autocmd! VimEnter * nested colorscheme iceberg
syntax enable

"=========================================================
" key mapping for MacOS
"=========================================================
if has('mac')
        augroup insertLeave
                autocmd!
                autocmd InsertLeave * :call job_start(
                                \ ['osascript', '-e', 'tell application "System Events" to key code {102}'],
                                \ {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
        augroup END
endif

set ttimeoutlen=1


