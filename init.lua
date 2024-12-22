
-- Set space as the leader key.
vim.g.mapleader = ' '  -- Set the leader key to space
vim.g.maplocalleader = ' '  -- (Optional) Set local leader key to space

-- Ensure space doesn't trigger anything by itself.
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('v', '<Space>', '<Nop>', { noremap = true, silent = true })  -- Optional for visual mode

-- Unmap `s` in normal mode to make it available for leader combinations.
vim.keymap.set('n', 's', '<Nop>', { noremap = true, silent = true })

require("config.lazy")

-- Set 2 spaces as tab
-- Width of an actual tab
vim.opt.tabstop = 2
vim.bo.softtabstop = 2
-- Size of an indent
vim.opt.shiftwidth = 2
-- Insert spaces instead of tabs
vim.opt.expandtab = true

-- Copy current indent to next line
vim.o.autoindent = true
-- Do smart autoindenting when starting a new line
vim.o.smartindent = true

-- Show relative number and number for line
vim.opt.number = true
vim.opt.relativenumber = true

-- Setup gruvbox colorscheme
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")


-- Telescope:
-- Docs:
-- While in a telescope window:
-- - <C-x> Go to file selection as a split
-- - <C-v> Go to file selection as a vsplit
-- - <C-q> Send all items not filtered to quickfixlist (qflist)
--
-- Keymappings
-- <leader><leader> : Find files
-- <leader>sp : Search for text in files (live grep)
-- <leader>sb : List open buffers
-- <leader>sh : Search help tags
vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sp', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })


-- Treesitter:
-- Syntax Highlighting
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- ------------ vim-sneak --------------
-- Plugin: vim-sneak
-- Docs:
-- - f: Jump forward to the nearest match of the next two characters.
-- - F: Jump backward to the nearest match of the next two characters.
-- - t: Jump forward to just before the nearest match of the next character.
-- - T: Jump backward to just before the nearest match of the next character.

-- Keybindings for vim-sneak
-- f: Forward to match
vim.keymap.set('', 'f', '<Plug>Sneak_s')

-- F: Backward to match
vim.keymap.set('', 'F', '<Plug>Sneak_S')

-- t: Forward to before match
vim.keymap.set('', 't', '<Plug>Sneak_t')

-- T: Backward to before match
vim.keymap.set('', 'T', '<Plug>Sneak_T')

-- Enable labels for sneak navigation
vim.g['sneak#label'] = 1
-- Labels show shortcuts to quickly jump to possible matches.


-- ------------ vim-dispatch --------------
-- Plugin: vim-dispatch
-- Docs:
-- 1. Commands:
--    - `:Make <cmd>`: Run a one-off command.
--    - `:Make! <cmd>`: Run a one-off command in the background.
--    - `:Dispatch <cmd>`: Set a compiler (if available) and run the build command.
--    - `:Dispatch! <cmd>`: Same as above, but in the background.
--    - `:Dispatch`: Run the default dispatch command.
--    - `:Focus <cmd>`: Overwrite the default dispatch with a new focus command.
--    - `:Focus!`: Reset the default dispatch.
--    - `:Start <cmd>`: Start a program and interact with it.
--
-- 2. Default Dispatch Shortcut:
--    - `<Leader><CR>`: Trigger the default `:Dispatch`.

-- Keybindings for Dispatch and Focus
-- Dispatch: Run a build or task using the :Dispatch command.
vim.keymap.set('n', '<leader>pc', '<cmd>Dispatch<cr>', { noremap = true, silent = true })

-- Focus: Overwrite the default dispatch with a new command.
vim.keymap.set('n', '<leader>p<Space>', ':Focus<Space>', { noremap = true, silent = false })  -- Silent is false for interactive input

-- ------------ vim-bazel -----------------
-- Plugin: vim-bazel
-- Docs:
-- 1. Commands:
--    - `:Bazel <command> {arguments}`: Interface to run Bazel commands.
--    - `:Bazel`: Attempts to build the target associated with the current file.
-- 
-- 2. Quickfix Integration:
--    - Errors and warnings are designed for C++ targets.
--    - Build and test commands populate the quickfix window for efficient navigation.
--
-- 3. Integration with vim-dispatch:
--    - Set `vim-dispatch` as the Bazel make command for seamless use with `:Make`.

-- Set vim-dispatch as the Bazel make command
vim.g.bazel_make_command = "Make"


-- ------------ neoformat ------------------
-- Plugin: neoformat
-- Docs:
-- - Neoformat formats files before saving.
-- - Ensure the correct linters/formatters are installed:
--   - `clang-format` for C/C++
--   - `latexindent` for LaTeX
--   - `psf/black` for Python
-- - This setup formats files on save.

-- Auto-format on save
vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
-- Note: `undojoin` ensures the undo history is preserved when formatting.

-- ----------- Spell Checker ----------
-- Enables Neovim's built-in spell checker with US English.
vim.opt.spelllang = "en_us"  -- Set spell check language
vim.opt.spell = true         -- Enable spell checking
