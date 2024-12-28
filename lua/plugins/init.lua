local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{--NOTE: Highlight todo comments.
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false }
	},
	{--NOTE: Fuzy Finder
		'nvim-telescope/telescope.nvim',
		event = "VimEnter",
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require "telescope.builtin"
			vim.keymap.set("n", "<leader>p", builtin.git_files)
			vim.keymap.set("n", "<leader>ff", builtin.find_files)
			vim.keymap.set("n", "<leader>ss", builtin.grep_string)
			vim.keymap.set("n", "<leader>sg", builtin.live_grep)
			vim.keymap.set("n", "<leader><leader>", builtin.buffers)
			vim.keymap.set('n', '<leader>f',
			function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end)
		end,
	},
	{--NOTE: Tree Sitter for highlight, edit and navigation
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {'c', 'cpp', 'html', 'lua', 'odin'},
				sync_install = false,
				auto_install = false,
				highlight = {enable = true, additional_vim_regex_highlighting = false},
				indent = {enable = true},
			}
		end,
	},
})
