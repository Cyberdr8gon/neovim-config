" To update plugins:
" :PackerSync
lua require('plugins')

" Set space as the leader key.
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>" 

" Remove s so that its easy to use with leader keys
nnoremap s <Nop>

" Disable skipping leader key.
set notimeout

" Set 2 spaces as tab
" Width of an actual tab
set tabstop=2
" Size of an indent
set shiftwidth=2
" Insert spaces instead of tabs
set expandtab
" Copy current indent to next line
set autoindent
" Do smart autoindenting when starting a new line
set smartindent

set nu
set rnu


" Setup colorscheme
set background=light " or dark if you want dark mode
lua << EOF
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {},
})
EOF

colorscheme gruvbox


"-------------- Telescope --------------
" Docs:
" While in a telescope window:
" - <C-x> Go to file selection as a split
" - <C-v> Go to file selection as a vsplit
" - <C-q> Send all items not filtered to quickfixlist (qflist)
"
" Config.
" Find files using Telescope command-line sugar.
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>sp <cmd>Telescope live_grep<cr>
nnoremap <leader>sb <cmd>Telescope buffers<cr>
nnoremap <leader>sh <cmd>Telescope help_tags<cr>



"----------- nvim-treesitter -----------
" Docs:
" To install a language parser:
" :TSInstall cpp
"
" To update a langauge parser:
" :TSUpdate
"
" Code folding:
" zo: open fold
" zc: close fold
" za: toggle current fold
"
" NOTE: Once must update language parsers after syncing. The config is
" designed to do this automatically.
"
" Workaround to fix packer not loading treesitter on direct open of file from
" cli.
function FoldConfig()
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
endfunction

autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()

" Setup nvim-treesitter modules
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "cpp", "python", "markdown", "proto", "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Setup code folding with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Make sure folding doesn't happen automatically on navigation
set foldlevel=99


" ------------ vim-sneak --------------
" Just like evil-snipe in doom emacs.
" Docs:
" f: to jump to the nearest match of the next two chacaters forward
" F: to jump to the nearest match of the next two chacaters backwords
" t: to jump to the nearest match of the next chacater forward
" T: to jump to the nearest match of the next chacater backwords
"
" Setup commands: 
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" show labels of how to get somewhere
let g:sneak#label = 1

" ------------ vim-dispatch --------------
" Docs:
" For a quick one off command:
" :Make <cmd>
" same but background:
" :Make! <cmd> 
"
" Try and set compiler if one exists, then run build command:
" :Dispatch <cmd>
" same but background:
" :Dispatch! <cmd>
" run default dispatch:
" :Dispatch
" also
" <Leader><CR>
"
" Overwrite the default dispatch:
" :Focus <cmd>
" reset the default dispatch:
" :Focus!
"
" Start a program and interact with it
" :Start <cmd>
"
" Custom commands to bind Dispatch and Focus
nnoremap <leader>pc <cmd>Dispatch<cr>
nnoremap <leader>p<Space> :Focus<Space>

" ------------ vim-bazel -----------------
" Docs:
" Provides an interface to bazel in the form:
" :Bazel <command> {arguments}
" attempt to build the target for which this file is a src:
" :Bazel
"
" Quickfix errorformat is designed exclusively for cpp for the time being.
"
" This works the same as normal bazel, except build and test will populate the
" quickfix window correctly.
"
" Setup to use vim-dispatch as make command.
let g:bazel_make_command = "Make"

" ------------ neoformat ------------------
"  Docs:
"  Nothing to see here, just make sure the right linters are installed to your
"  system. Will format on save.
"
"  Consider installing the following:
"  - clang-format
"  - latexindent
"  - psf/black
"
" This command sets up linting on save.
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ----------- Spell Checker ----------
"  Docs:
"  This enables the default spellchecker in neovim
set spelllang=en_us
set spell


