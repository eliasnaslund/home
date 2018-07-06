set nocompatible              " required 
filetype off                  " required 

" set the runtime path to include Vundle and initialize 
set rtp+=~/.config/nvim/bundle/Vundle.vim 
call vundle#begin() 

" alternatively, pass a path where Vundle should install plugins 
call vundle#begin('~/.config/nvim/bundle') 

" let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim' 

" add all your plugins here (note older versions of Vundle 
" used Bundle instead of Plugin) 

" ... 
Plugin 'tmhedberg/SimpylFold' 
Plugin 'vim-scripts/indentpython.vim' 
Plugin 'vim-syntastic/syntastic' 
Plugin 'nvie/vim-flake8' 
Plugin 'jnurmine/Zenburn' 
Plugin 'altercation/vim-colors-solarized' 
Plugin 'scrooloose/nerdtree' 
Plugin 'Valloric/YouCompleteMe' 
Plugin 'SirVer/ultisnips' 
Plugin 'honza/vim-snippets' 
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} 

" All of your Plugins must be added before the following line 
call vundle#end()            " required 
filetype plugin indent on    " required 

let mapleader = ',' 

"split navigations 
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H> 

" Enable folding 
set foldmethod=indent 
set foldlevel=99 

" Enable folding with the spacebar 
nnoremap <space> za 

let g:SimpylFold_docstring_preview=1 

au BufNewFile,BufRead *.py 
    \ set tabstop=4 | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set cc=79 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set fileformat=unix | 

"define BadWhitespace before using in a match 
highlight BadWhitespace ctermbg=red guibg=darkred 
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 

set encoding=utf-8 

let g:ycm_autoclose_preview_window_after_completion=1 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> 
let g:ycm_python_binary_path = '/usr/bin/python3' 
let g:ycm_complete_in_comments = 1 
let g:ycm_confirm_extra_conf = 0 
let g:ycm_collect_identifiers_from_tags_files = 1 
let g:ycm_min_num_of_chars_for_completion = 1 
let g:ycm_auto_trigger = 1 


let python_highlight_all=1 
syntax on 


if has('gui_running') 
  set background=dark 
  colorscheme solarized 
else 
  colorscheme zenburn 
endif 

call togglebg#map("<F5>") 

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree 

" Serching Ctrl + P 
Plugin 'kien/ctrlp.vim' 

set nu 



set hidden 

let g:ycm_global_ycm_extra_conf = '/home/elias/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py' 


" UltiSnips 
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. 
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsListSnippets="<f5>" 
let g:UltiSnipsJumpForwardTrigger="<c-b>" 
let g:UltiSnipsJumpBackwardTrigger="<c-z>" 

" If you want :UltiSnipsEdit to split your window. 
let g:UltiSnipsEditSplit="vertical" 

" Disable Tab, use C-N and C-P instead 
let g:ycm_key_list_select_completion=[] 
let g:ycm_key_list_previous_completion=[] 

au BufNewFile,BufRead *.c,*.h 
    \ set tabstop=4 | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set cc=80 | 
    \ set expandtab | 
    \ set autoindent | 
    \ set fileformat=unix | 



" Code formatting 
function! ClangFormat() 
    let l:lines = "all" 
    py3f /usr/share/clang/clang-format-7/clang-format.py 
endfunction 

nmap <c-f>:call ClangFormat()<cr> 
imap <c-f> <c-o>:call ClangFormat()<cr> 
