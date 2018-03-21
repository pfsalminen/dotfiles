execute pathogen#infect()
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<S-Enter>'
map <C-m> :YcmCompleter GoTo<CR>
nmap <C-k> :YcmCompleter GetDoc<CR>
syntax on
set autoread
set number
let t_Co = 256

" Niceness
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

let g:syntastic_check_on_open = 1
set expandtab
set shiftwidth=4
set softtabstop=4
let g:rainbow_active = 1

" Powerline
syntax enable
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256


" NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * wincmd w
