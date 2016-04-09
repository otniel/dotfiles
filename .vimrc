set nocompatible              " Latest vim Settings
so ~/.vim/plugins.vim

"----------------General Settings---------------"

let mapleader = ","
let g:mapleader = ","
let g:netrw_liststyle=4
set nowrap
set tags=tags
set autowriteall                                "Automatically write the file when switching buffers.
set complete=.,w,b,u                            "Set our desired autocompletion matching.

" Tabs chars settings
set ts=4 sts=4 sw=4 expandtab

set backspace=indent,eol,start
set autoindent
set copyindent
set ignorecase
set smartcase
set timeout timeoutlen=200 ttimeoutlen=100
set noerrorbells



"----------------Auto Commands----------------"

if has("autocmd")
	" Set custom tabs/space settings per filetype
    augroup autotabbing
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
        autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab 
        autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab 
        autocmd BufNewFile,BufRead *.vue setfiletype html
    augroup END

	" Source .vimrc when saving.
    augroup autosourcing
        autocmd!
        autocmd bufwritepost .vimrc source $MYVIMRC
    augroup END
endif



"----------------Visuals----------------"

set t_Co=256

colorscheme jellybeans

" Fake custom left padding
hi LineNr ctermfg=none ctermbg=bg

hi Normal ctermbg=none

hi NonText ctermbg=none



" Split lines colors
set foldcolumn=2
hi foldcolumn ctermbg=none
hi vertsplit ctermbg=none

"----------------Split Management----------------"

set splitbelow
set splitright

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
nmap bp :bp<cr>
nmap bd :bd<cr>

" Easy split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Resize splits
nmap <C-v> :vertical resize +5<cr>
nmap <leader>w :w!<cr>
nmap <leader>l :set list!<CR>



"----------------Searching----------------"

set hlsearch
set incsearch
set ignorecase
nmap <Leader><space> :nohlsearch<cr>



"----------------Plugins----------------"

"/
"/ CtrlP
"/

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|DS_Store\|git'

let g:ctrlp_extensions = ['buffertag']
map <C-s> :CtrlPBufTag<cr>

"/
"/ nerdtree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <C-b> :NERDTreeToggle<cr>

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  
let g:php_cs_fixer_fixers_list="-psr0"

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"----------------PHP/Laravel specific----------------"

map <Leader>lr :tabedit app/Http/routes.php<cr>

"/
"/ Testing
"/

nmap <Leader>t :!clear; vendor/bin/phpunit<cr>
nmap <Leader>m yiw:! vendor/bin/phpunit --filter "<cr>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>



"----------------Mappings----------------"

" Make go up/down really go  to the next line
nnoremap j gj
nnoremap k gk

" Use emmet-vim autocompletion
imap hh <C-y>,                                                  

" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Find occurences of the word
nmap <Leader>n viwy/"                             
nmap <CR> :write<CR> 

" Shortcut tag searching
nmap <Leader>f :tag<space>

" Easy escaping to normal mode
imap jj <Esc>
nmap <Leader>p :set paste!<cr>
