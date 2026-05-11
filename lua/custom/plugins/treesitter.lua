return {
    {
	'nvim-treesitter/nvim-treesitter',
    branch = 'main',
	lazy = false,
	build = ':TSUpdate',
    init = function ()

        local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "html", }

        local already_installed = require('nvim-treesitter.config').get_installed()
        local to_install = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(already_installed, parser)
            end)
            :totable()
        if #to_install > 0 then
            require('nvim-treesitter').install(to_install)
        end
    end,
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            -- Skip Treesitter for large file sizes
            callback = function(ev)
                local buf = ev.buf
                local max_filesize = 100 * 1024 -- 100 KB

                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return
                end

                -- Enable Neovim-native treesitter highlighting
                pcall(vim.treesitter.start, buf)
            end,
        })
    end,
	-- config = function ()
	--     require'nvim-treesitter.configs'.setup {
	-- 	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	-- 	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "html" },
	-- 	auto_install = false,
	-- 	ignore_install = { "javascript" },
	--
	-- 	highlight = {
	-- 	    enable = true,
	--
	-- 	    disable = function(lang, buf)
	-- 		local max_filesize = 100 * 1024 -- 100 KB
	-- 		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	-- 		if ok and stats and stats.size > max_filesize then
	-- 		    return true
	-- 		end
	-- 	    end,
	--
	-- 	    additional_vim_regex_highlighting = false,
	-- 	},
	--     }
	-- end,
    },
}
