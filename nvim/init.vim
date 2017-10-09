set termguicolors
" base config
filetype indent on
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
syntax on
set shell=zsh
set clipboard=unnamedplus
set hidden
set number
set mouse=a
set completeopt=longest,menuone
colorscheme desert

" leader config
let g:mapleader = "\<space>"

" langlayer
let g:langlayer_pre = '<leader>m'

function! EnableLangLayer(name)
  exec 'nmap <silent>' . g:langlayer_pre . 'b ' . execute('echon g:langlayer_' . a:name . '_build')
  exec 'nmap <silent>' . g:langlayer_pre . 'r ' . execute('echon g:langlayer_' . a:name . '_run')
endfunction

function! DisableLangLayer()
  exec 'nunmap ' . g:langlayer_pre . 'b'
  exec 'nunmap ' . g:langlayer_pre . 'r'
endfunction

function! HookLang(pattern, name)
  exec 'autocmd! BufEnter ' . a:pattern . ' call EnableLangLayer("' . a:name . '")'
  exec 'autocmd! BufLeave ' . a:pattern . ' call DisableLangLayer()'
endfunction

" win manipulation
for i in range(1, 9)
  exec printf("nnoremap <silent><leader>%d :%dwincmd w<CR>", i, i)
endfor

nnoremap <silent><leader>wv :vsplit<CR>
nnoremap <silent><leader>wh :split<CR>
nnoremap <silent><leader>wd :close<CR>

" file nav
nnoremap <silent><leader>ff :call fzf#vim#files(expand('%:p:h'))<CR>
nnoremap <silent><leader>fw :Files .<CR>
nnoremap <silent><leader>fW :Files? .<CR>
nnoremap <silent><leader>fh :Files ~<CR>
nnoremap <silent><leader>fH :Files? ~<CR>
nnoremap <silent><leader>fp :GFiles<CR>
nnoremap <silent><leader>fP :GFiles?<CR>
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <silent><leader>fB :Buffers?<CR>
" config reload/edit
nnoremap <silent><leader>feR :so $MYVIMRC<CR>
nnoremap <silent><leader>fed :e $MYVIMRC<CR>

" switch back
nnoremap <silent><leader><tab> <c-^>

" moving around
nmap <leader>mf <Plug>(easymotion-overwin-f)
nmap <leader>ms <Plug>(easymotion-overwin-f2)
nmap <leader>ml <Plug>(easymotion-overwin-line)
nmap <leader>mw <Plug>(easymotion-overwin-w)

" search
nmap <leader>s/ <Plug>(incsearch-easymotion-/)
nmap <leader>s? <Plug>(incsearch-easymotion-?)
nmap <leader>sg/ <Plug>(incsearch-easymotion-stay)
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" autocompletion
let g:deoplete#enable_at_startup=1
inoremap <c-space> <c-x><c-o>
inoremap <expr><c-j> pumvisible() ? "\<down>" : "\<c-j>"
inoremap <expr><c-k> pumvisible() ? "\<up>" : "\<c-k>"
inoremap <expr><CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"

" golang config
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

let g:langlayer_go_build = ':!gb build<CR>'
let g:langlayer_go_run = ':GoRun<CR>'
call HookLang('*.go', 'go')

" rust config
let g:langlayer_rust_build = ':!cargo build<CR>'
let g:langlayer_rust_run = ':! cargo run<CR>'
let g:racer_cmd = $HOME . '/.local/bin/racer'
call HookLang('*.rs', 'rust')

" plugins
call plug#begin($XDG_DATA_HOME . '/nvim/plugged')
Plug 'sickill/vim-pasta'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'plasticboy/vim-markdown'
Plug 'neomake/neomake'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': $XDG_DATA_HOME . '/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim'
call plug#end()


