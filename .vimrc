call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
" highlight for :substitude
Plug 'markonm/traces.vim'
" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" 自动分号补全
Plug 'Raimondi/delimitMate'
" 书签增强
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
" 语法包
Plug 'sheerun/vim-polyglot'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
" Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'm-pilia/vim-ccls'
" rust
Plug 'rust-lang/rust.vim'
call plug#end()

" general {
syntax enable
let $LANG = 'en_US'
let mapleader = ','
set nu rnu
set ts=4 et sw=4 sta
set hls
set nocp
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set cursorline cursorcolumn
augroup cursor_position
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline cursorcolumn
    autocmd InsertEnter,WinLeave * set nocursorline nocursorcolumn
augroup END
set hidden
set incsearch ignorecase smartcase
" color dracula
"}

" gruvbox {
set background=dark
let g:gruvbox_italic         = 1
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark  = 'soft'
let g:gruvbox_undercurl      = 1
let g:gruvbox_termcolors     = 256
let g:gruvbox_underline      = 1
color gruvbox
" }

" custom keymap {
noremap j jzz
noremap k kzz
"noremap <BS> <C-w>h
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <silent> <leader>= :exe "resize" . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize" . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>0 :exe "vertical resize" . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>9 :exe "vertical resize" . (winwidth(0) * 2/3)<CR>
noremap <silent><F4> :set wrap!<CR>
noremap <silent><F9> :TagbarToggle<CR>
inoremap jk <esc>
set mouse-=a
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <silent> <leader>g :b#<CR>
noremap <silent> <leader>t :enew<CR>
noremap <silent> <leader>x :bd<CR>
noremap ; :
noremap / /\v

" 保持选择
xnoremap < <gv
xnoremap > >gv
" }

" nerdtree {
noremap <silent><leader>n :NERDTreeToggle<CR>
augroup cursor_position
    autocmd BufEnter NERD_tree_* set cursorline nocursorcolumn
augroup END
" }

" airline {
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" }

" nerdcommenter {
let g:NERDSpaceDelims = 1
" }

" ctrlspace {
nnoremap <silent> <C-p> :CtrlSpace O<CR>
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" }

" easy align {
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }

" easymotion {
let EasyMotion_smartcase=1
nmap F <Plug>(easymotion-Fl)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)
nmap f <Plug>(easymotion-fl)
nmap <leader><leader>s <Plug>(easymotion-overwin-f)
" }

" rainbow {
let g:rainbow_active = 1
" }

" coc.nvim {
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

" Highlight symbol under cursor on CursorHold
augroup highlight_symbol
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')
augroup END
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Search workspace symbols
nnoremap <silent> <leader>o  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>l  :<C-u>CocList<cr>
" Remap keys for gotos
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
" }

" vim-ccls {
let g:ccls_size=10
let g:ccls_position='botright'
let g:ccls_orientation='horizontal'
nmap <silent><leader>jh :CclsCallHierarchy<cr>
nmap <silent><leader>jH :CclsCalleeHierarchy<cr>
nmap <silent><leader>jm :CclsMemberHierarchy<cr>
nmap <silent><leader>jb :CclsDerivedHierarchy<cr>
nmap <silent><leader>jB :CclsBaseHierarchy<cr>
" }

" vim-trailing-whitespace {
nnoremap <silent><leader><space> :FixWhitespace<cr>
" }

" vim-highlightedyank {
let g:highlightedyank_highlight_duration = 350
" }
