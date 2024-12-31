vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = ture

vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'

vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<F5>", ":!build.bat<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--NOTE(Dhumil): Jblow colorscheme
vim.cmd [[hi normal guibg=#072626]]
vim.cmd [[hi @keyword guifg=#FFFFFF]]
vim.cmd [[hi @module guifg=#D3B58D]]
vim.cmd [[hi @type.builtin guifg=#98FB98]]
vim.cmd [[hi @type guifg=#D3B58D]]
vim.cmd [[hi @variable guifg=#D3B58D]]
vim.cmd [[hi @variable.builtin guifg=#FFFFFF]]
vim.cmd [[hi @constant guifg=#D3B58D]]
vim.cmd [[hi @constant.builtin guifg=#7FFFD4]]
vim.cmd [[hi @function guifg=#D3B58D]]
vim.cmd [[hi @punctuation guifg=#D3B58D]]
vim.cmd [[hi @spell guifg=#3DDF23]]
vim.cmd [[hi @number guifg=#7FFFD4]]
vim.cmd [[hi @string guifg=#0FDFAF]]
vim.cmd [[hi @character guifg=#0FDFAF]]
vim.cmd [[hi @boolean guifg=#7FFFD4]]
vim.cmd [[hi @operator guifg=#D3B58D]]
vim.cmd [[hi Visual guibg=#0000FF]]
