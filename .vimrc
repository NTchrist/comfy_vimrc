"
" comfy vimrc for comfy server adminning
"

set relativenumber               " Show relative line numbers to help with line-based navigation
set number                       " Display the absolute line number for the current line
set backspace=indent,eol,start   " Allow backspacing over indentation, line breaks, and start of insert
set ruler                        " Show the cursor position (line and column) in the status line
set mouse=a                      " Enable mouse support in all modes (normal, insert, visual, etc.)
syntax enable                    " Enable syntax highlighting based on file type
set si                           " Enable smart indenting when starting a new line
set ai                           " Enable automatic indentation of new lines
set softtabstop=4                " Insert/delete up to 4 spaces when hitting the tab key, depending on context
set shiftwidth=4                 " Use 4 spaces for automatic indentation
set tabstop=4                    " Set a tab character to be displayed as 4 spaces
set smarttab                     " Make tab and backspace behavior context-aware (e.g., use softtabstop settings)
set nobackup                     " Disable backup file creation to prevent clutter
set hlsearch                     " Highlight all matching search results
set incsearch                    " Show search matches incrementally as you type
set pastetoggle=<F11>            " Toggle paste mode with F11 to toggle autoformatting when pasting
set paste                        " Disables autoformatting by default when pasting
set scrolloff=5                  " Keep at least 5 lines of context above and below the cursor
let cscflag = ""                 " Initialize a custom flag for use in the status line
set laststatus=2                 " Always display the status line, even with only one window open
set showcmd                      " Display incomplete commands in the status line for better visibility
set noeol                        " Do not add an end-of-line character to the last line of the file
set et                           " Convert tabs to spaces when editing
set clipboard+=unnamedplus       " Set clipboard to use system registers by default
set report=0                     " Always show messages for yank, delete, etc

" Configure the status line to display file info, flags, cursor position, etc.
set statusline=%<%F+0x%O\ %(%h%m%r%)%{cscflag}%=0x%B\ %l,%c%V\ %P

" vim legacy options (not required for, or invalid in nvim)
if !has('nvim')
    set ttymouse=sgr                 " Set mouse mode for more modern terminals
    set ttymouse=sgr                 " Set mouse mode for more modern terminals
    set nocompatible                 " Disable vi compatibility mode for better Vim-specific features
    set guioptions=ac                " GUI options: enable scrollbar arrows (a) and close button (c)
    set nofsync                      " Disable file syncing for faster disk operations (may risk data loss on crashes)
    set swapsync=                    " Disable swap file syncing to disk for performance improvements
    if &t_Co >= 256
        set cursorline           " Set a highlight line
        set cursorcolumn         " Set a highlight column
    endif
endif

if has('nvim')
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost *  
            \ silent! lua vim.highlight.on_yank({timeout=1500})
    augroup END
endif

colorscheme jellybeans           " Set custom colorscheme

" Set :w!! to 'sudo save'
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
