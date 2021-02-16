let &packpath = &runtimepath

call plug#begin(stdpath('data') . '/plugged')
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" multiple cursor
Plug 'mg979/vim-visual-multi'

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
" highlight for :substitude
Plug 'markonm/traces.vim'
" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'

" 自动分号补全
Plug 'Raimondi/delimitMate'
" 书签增强
Plug 'kshenoy/vim-signature'
Plug 'junegunn/rainbow_parentheses.vim'
" 语法包
Plug 'sheerun/vim-polyglot'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'm-pilia/vim-ccls'
" rust
Plug 'rust-lang/rust.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fuzzy search
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" highlight words
Plug 'lfv89/vim-interestingwords'

" buffer manager
Plug 'bagrat/vim-buffet'

" underscore to camelcase
Plug 'tpope/vim-abolish'

" diff
Plug 'chrisbra/vim-diff-enhanced'
Plug 'AndrewRadev/linediff.vim'

call plug#end()

" general {
syntax enable
let $LANG = 'en_US'
let mapleader = ','
set number relativenumber
set tabstop=4 expandtab shiftwidth=4 smarttab shiftround
set hlsearch
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set cursorline cursorcolumn
set showmatch matchtime=1
augroup cursor_position
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline cursorcolumn
    autocmd InsertEnter,WinLeave * set nocursorline nocursorcolumn
augroup END
set hidden
set incsearch ignorecase smartcase

set ttimeoutlen=50
augroup filetype_cmd
    autocmd!
augroup END
"}

" gruvbox {
let g:gruvbox_italic         = 1
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark  = 'medium'
let g:gruvbox_undercurl      = 1
let g:gruvbox_termcolors     = 256
let g:gruvbox_underline      = 1
" }

" OceanicNext {
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" }

" PaperColor {
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0,
  \       'allow_bold': 1,
  \       'allow_italic': 1,
  \     }
  \   },
  \   'language': {
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
" }

" theme {
set background=dark
set termguicolors
color PaperColor
" }

" custom keymap {
nnoremap <silent> j jzz
nnoremap <silent> k kzz
"noremap <BS> <C-w>h
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <silent> <leader>= :exe "resize" . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize" . (winheight(0) * 2/3)<CR>
" nnoremap <silent> <leader>0 :exe "vertical resize" . (winwidth(0) * 3/2)<CR>
" nnoremap <silent> <leader>9 :exe "vertical resize" . (winwidth(0) * 2/3)<CR>
noremap <silent><F3> :set relativenumber! number! list! lcs=tab:..<CR>
noremap <silent><F4> :set wrap!<CR>
noremap <silent><F9> :TagbarToggle<CR>
inoremap jk <esc>
set mouse-=a
noremap <up>     <nop>
noremap <down>   <nop>
noremap <left>   <nop>
noremap <right>  <nop>
" noremap <silent> <leader>g :b#<CR>
" noremap <silent> <leader>t :enew<CR>
" noremap <silent> <leader>x :bd<CR>
noremap ; :
noremap / /\v

" 保持选择
vnoremap < <gv
vnoremap > >gv

" command mode key map
cnoremap <c-a> <c-b>
cnoremap <c-b> <left>
cnoremap <c-f> <right>

" copy paste
nnoremap <silent> <leader>y "+y
nnoremap <silent> <leader>p "+p

" }

" Return to last edit position when opening files (You want this!)
augroup savepos
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" nerdtree {
nnoremap <silent><leader>n :NERDTreeToggle<CR>
augroup cursor_position
    autocmd BufEnter NERD_tree_* set cursorline nocursorcolumn
augroup END
" }

" vim-nerdtree-syntax-highlight {
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName    = 1
let g:NERDTreePatternMatchHighlightFullName  = 1
let g:NERDTreeHighlightFolders               = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName       = 1 " highlights the folder name
let g:NERDTreeHighlightCursorline            = 0
" }

" airline {
let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled = 1
" }

" nerdcommenter {
let g:NERDSpaceDelims = 1
" }

" rainbow_parentheses {
augroup rainbow_enable
    autocmd!
    autocmd VimEnter * RainbowParentheses
augroup END
" }

" ctrlspace {
" nnoremap <silent> <C-p> :CtrlSpace O<CR>
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" }

" easy align {
" Start interactive EasyAlign in visual mode (e.g. vipga)
" vmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
" }

" easymotion {
let EasyMotion_smartcase=1
nmap F <Plug>(easymotion-Fl)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)
nmap f <Plug>(easymotion-fl)
nmap <leader><leader>s <Plug>(easymotion-overwin-f)
" }

" vim-clap {
nnoremap <silent><leader>b :Clap buffers<CR>
nnoremap <silent><leader>f :Clap files<CR>
nnoremap <silent><leader>rg :Clap grep ++query=<cword><CR>
let g:clap_disable_run_rooter = v:true
let g:clap_theme = 'material_design_dark'
let g:clap_preview_direction='UD'
let g:clap_layout = { 'width': '68%', 'height': '55%', 'row': '13%', 'col': '16%' }
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
" auto show signcolumns
set signcolumn=auto
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
nmap <leader>rf <Plug>(coc-refactor)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Search workspace symbols
nnoremap <silent> <leader>l  :CocList<cr>
nnoremap <silent> <leader>o  :CocList -I symbols<cr>
" nnoremap <silent> <leader>f  :CocList files<cr>
" nnoremap <silent> <leader>rg  :CocList grep<cr>
" nnoremap <silent> <C-space>  :CocList --normal buffers<cr>
" Remap keys for gotos
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)

highlight link CocRustChainingHint CocCodeLens
" }

" coc-snippets {
" Use Tab for expand snippet
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <Tab> for select text for visual placeholder of snippet.
vnoremap <tab> <Plug>(coc-snippets-select)
" Use <C-s> for both expand and jump (make expand higher priority.)
imap <C-s> <Plug>(coc-snippets-expand-jump)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" }

" vim-ccls {
let g:ccls_size=10
let g:ccls_position='botright'
let g:ccls_orientation='horizontal'
nnoremap <silent><leader>jh :CclsCallHierarchy<cr>
nnoremap <silent><leader>jH :CclsCalleeHierarchy<cr>
nnoremap <silent><leader>jm :CclsMemberHierarchy<cr>
nnoremap <silent><leader>jb :CclsDerivedHierarchy<cr>
nnoremap <silent><leader>jB :CclsBaseHierarchy<cr>
augroup filetype_cmd
    autocmd FileType yggdrasil setlocal nonumber norelativenumber
augroup END
" }

" vim-trailing-whitespace {
nnoremap <silent><leader><space> :FixWhitespace<cr>
" }

" vim-highlightedyank {
let g:highlightedyank_highlight_duration = 350
" }

" vim-buffet {
let g:buffet_powerline_separators=1
let g:buffet_show_index=1
let g:buffet_tab_icon="\uf00a" " 
let g:buffet_left_trun_icon="\uf0a8" " 
let g:buffet_right_trun_icon="\uf0a9" " 
noremap <silent> <leader><Tab> :bn<CR>
noremap <silent> <S-Tab> :bp<CR>
noremap <silent> <leader>x :Bw!<CR>
noremap <silent> <leader>t :enew<CR>
noremap <silent> <leader>g :b#<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#009900 guifg=#000000
endfunction

" }
