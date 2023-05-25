set clipboard=unnamed

"tame searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

" quicker to vim command line
nnoremap ; :

if !exists('g:vscode')
  " enable true color
  " Automatic with Neovim now
  " set termguicolors
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  set mouse=a

  " change <leader> from '\' to ','
  let mapleader = ','

  let g:polyglot_disabled = ['typescript.plugin', 'typescriptreact.plugin']

  " Plugins
  call plug#begin('~/.local/share/nvim/plugged')
  " Make sure you use single quotes

  " Plug 'chriskempson/base16-vim'
  " Using the onedark theme, below, for now

  " Plug 'joshdick/onedark.vim'
  " Plug 'haishanh/night-owl.vim'
  Plug 'kaicataldo/material.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'drewtempelmeyer/palenight.vim'

  Plug 'tpope/vim-sleuth'
  " This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based
  " on the current file, or, in the case the current file is new, blank, or otherwise
  " insufficient, by looking at other files of the same type in the current and parent
  " directories. In lieu of adjusting 'softtabstop', 'smarttab' is enabled.

  Plug 'tpope/vim-fugitive'

  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  Plug 'itchyny/lightline.vim'
  let g:lightline = {
  \ 'colorscheme': 'palenight',
  \ }
  " \ 'active': {
  " \   'right': [ [ 'percent', 'lineinfo' ],
  " \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
  " \ }
  " \ }

  " Plug 'edkolev/tmuxline.vim'
  "let g:tmuxline_powerline_separators = 0
  " Not using this right now

  Plug 'scrooloose/nerdcommenter'
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
  " nnoremap <leader>[ :NERDTreeToggle<CR>

  " Plug 'pangloss/vim-javascript' " See sheerun/vim-polyglot
  " Plug 'mxw/vim-jsx' " See sheerun/vim-polyglot
  " Plug 'elzr/vim-json' " See sheerun/vim-polyglot
  " Plug 'cakebaker/scss-syntax.vim' " See sheerun/vim-polyglot
  " Plug 'ekalinin/Dockerfile.vim' " See sheerun/vim-polyglot
  Plug 'heavenshell/vim-jsdoc'
  Plug 'sheerun/vim-polyglot'
  " README: Loads language packs on-demand, fast
  
  " Better than plugins packaged with vim-polyglot?
  " https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  "coc Plug 'othree/javascript-libraries-syntax.vim'
  "coc let g:used_javascript_libs = 'requirejs,react'
  " README: Syntax support for JavaScript libraries

  "coc Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  " README: JavaScript Parameter Complete -- most other completion plugins can't
  " do this.

  " Not currently in vim-polyglot
  " Plug 'ianks/vim-tsx' " somethign similar added to vim-polyglot

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)

  " Jump to next or prev error
  nmap <silent> g[ <Plug>(coc-diagnostic-prev)
  nmap <silent> g] <Plug>(coc-diagnostic-next)

  " Code actions: automated changes or fixes for an issue
  nmap <leader>. <Plug>(coc-codeaction)
  nmap <leader>rn <Plug>(coc-rename)

  " NCM2 Install {{{
  "coc Plug 'ncm2/ncm2'
  "coc Plug 'roxma/nvim-yarp'

  " enable ncm2 for all buffers
  "coc autocmd BufEnter * call ncm2#enable_for_buffer()

  " IMPORTANT: :help Ncm2PopupOpen for more information
 "coc  set completeopt=noinsert,menuone,noselect

  " NOTE: you need to install completion sources to get completions. Check
  " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
"coc   Plug 'ncm2/ncm2-bufword'
"coc   Plug 'ncm2/ncm2-tmux'
"coc   Plug 'ncm2/ncm2-path'
  " }}} NCM2 Install
  "
"coc   Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
  " README: Will hook into omni completion to handle autocompletion, and provide the
  " following commands:
  " - TernDef: Jump to the definition of the thing under the cursor.
  " - TernDoc: Look up the documentation of something.
  " - TernType: Find the type of the thing under the cursor.
  " - TernRefs: Show all references to the variable or property under the cursor.
  " - TernRename: Rename the variable under the cursor.
"coc   Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
  " Tern for completion manager

  " Plug 'w0rp/ale'
  " Plug 'dense-analysis/ale'
  " let g:ale_sign_column_always = 1
  " let g:ale_fix_on_save = 1
  " let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
  " let g:ale_linters = {
  " \ 'typescript': ['eslint','tsserver'],
  " \}
  " let g:ale_fixers = {
  " \ '*': ['trim_whitespace'],
  " \ 'typescript': ['eslint', 'prettier'],
  " \ 'javascript': ['eslint', 'prettier'],
  " \}
"
  " Plug 'derekwyatt/vim-scala'
  Plug 'honza/vim-snippets'

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  Plug 'mileszs/ack.vim'

  Plug 'xolox/vim-misc'
  let g:easytags_suppress_ctags_warning = 1
  Plug 'xolox/vim-easytags'
  set tags=$HOME/.vimtags
  Plug 'majutsushi/tagbar'
  nnoremap <leader>] :TagbarToggle<CR>

  Plug 'terryma/vim-multiple-cursors'

  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  nmap <leader>b :Buffers<CR>
  nmap <leader>a :Files<CR>
  nmap <leader>g :GFiles?<CR>
  nmap <C-p> :GFiles<CR>
  nmap <M-p> :GFiles<CR>
  nmap <leader>/ :Rg<Space>

  "Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
  " TODO: Would this be useful again?

  Plug 'kassio/neoterm'

  Plug 'janko-m/vim-test'

  Plug 'rizzatti/dash.vim'

  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons' " Supported by barbar & nvim-tree
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'romgrk/barbar.nvim'

  " Add plugins to &runtimepath
  call plug#end()

  " Themes
  set background=dark

  " colorscheme base16-default-dark
  " let g:onedark_terminal_italics = 1
  " colorscheme onedark
  " colorscheme night-owl
  " let g:material_theme_style = 'palenight'
  " colorscheme material
  " colorscheme tender
  colorscheme palenight

  " Font
  "set guifont=Inconsolata-g:h11
  " set guifont=Fira\ Code

  " quicker Esc
  inoremap jj <ESC>

  " shortcut to toggle `set list`
  nmap <leader>l :set list!<CR>

  "teach new vim users good navigation habits
  " nnoremap <up> <nop>
  " nnoremap <down> <nop>
  " nnoremap <left> <nop>
  " nnoremap <right> <nop>
  " inoremap <up> <nop>
  " inoremap <down> <nop>
  " inoremap <left> <nop>
  " inoremap <right> <nop>
  " nnoremap j gj
  " nnoremap k gk

  "get rid of help key when aiming for <Esc>
  inoremap <F1> <ESC>
  nnoremap <F1> <ESC>
  vnoremap <F1> <ESC>

  " Use TextMat symbols for tabstop and EOL
  set listchars=tab:▸\ ,eol:¬

  "nudge to keep lines under 80 character width
  set colorcolumn=85

  " clear highlighting
  nnoremap <leader><space> :noh<cr>

  " line numbering
  set relativenumber
  set number

  " new buffer in split window
  nmap <leader>sh :leftabove  vnew<CR>
  nmap <leader>sl :rightbelow vnew<CR>
  nmap <leader>sk :leftabove  new<CR>
  nmap <leader>sj :rightbelow new<CR>

  " tab settings
  " Not necessary with tpope/vim-sleuth
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set noexpandtab

  " Terminal go back to normal mode
  tnoremap <Esc> <C-\><C-n>
  " When switching to terminal windows it goes into insert mode automatically
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " terminal key remappings
  tnoremap jj <C-\><C-n>

  " filetype-specific settings
  au FileType python setl sw=4 sts=4 et
  autocmd FileType markdown let b:noTrimWhitespace=1
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

  " let g:python_host_prog = '/usr/local/bin/python'
  " let g:python3_host_prog = '/usr/local/bin/python3'
  let g:python_host_prog = 'python'
  let g:python3_host_prog = 'python3'

  let g:rg_command = 'g:rg_binary --vimgrep --regexp --smart-case' " fzf.vim plugin

  " Fugitive conflict resolution
  nnoremap gdj :diffget //2<CR>
  nnoremap gdl :diffget //3<CR>

  " Copy file path
  nmap <leader>cp :let @*=expand("%")<CR>

lua <<EOF
  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    lsp_diagnostics     = false,
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    view = {
      width = 30,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
EOF

  nnoremap <leader>[ :NvimTreeToggle<CR>
endif
