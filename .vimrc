set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set mouse+=a 
syntax on
set nu
set clipboard=unnamed
set backspace=indent,eol,start
set autoindent
filetype plugin indent on

"PLUGINS"
"-------"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/mileszs/ack.vim.git'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdcommenter'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/goyo.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/seoul256.vim'
call plug#end()

"OPTION SETTINGS"
"---------------"

"Color Scheme"
syntax enable
set background=dark
set t_Co=256
"colorscheme seoul256
let g:seoul256_background = 234
colo seoul256

"Options For Light Line"
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

"Options for Vim Instant Markdown"
filetype plugin on

"Options for NERDTree"
"Auto start NERDTree for director
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufEnter * lcd %:p:h
map <C-a> :NERDTreeToggle<CR>
" Close if NERD Tree is last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1

"Options for Closetag"
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
