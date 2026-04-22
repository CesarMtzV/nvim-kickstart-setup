return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim"
                            }
                        }
                    }
                }
            })
            vim.lsp.enable("pyright")
            vim.lsp.enable("prismals")
            vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
}
