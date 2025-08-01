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
    {--NOTE: Fuzy Finder
        'nvim-telescope/telescope.nvim',
        event = "VimEnter",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<leader>sh", builtin.help_tags)
            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>sw", builtin.grep_string)
            vim.keymap.set("n", "<leader>s", builtin.live_grep)
            vim.keymap.set("n", "<leader>b", builtin.buffers)

            vim.keymap.set('n', '<leader>fs', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end)
            vim.keymap.set("n", "<leader>of", function()
                builtin.find_files {search_dirs = {"C:/Odin/base","C:/Odin/core","C:/Odin/vendor"}}
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
    {
        "whizikxd/naysayer-colors.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("naysayer")
        end
    },
})
