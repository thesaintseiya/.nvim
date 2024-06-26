vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

require 'lazy_setup'
require 'remaps'
require 'set'
require 'commands'

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
