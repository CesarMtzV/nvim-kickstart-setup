return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set("n", "<space>ff", builtin.find_files)

            vim.keymap.set("n", "<space>fh", function()
                builtin.find_files {
                    hidden = true,
                    no_ignore = true
                }
            end)

            vim.keymap.set("n", "<space>fg", builtin.live_grep)

            vim.keymap.set("n", "<space>en", function()
                builtin.find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
        end
    }
}
