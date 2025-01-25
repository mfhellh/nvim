return {

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },


    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "vim", "vimdoc", "query", "typescript", "javascript", "html" },
                sync_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end
    },

    {
        "mbbill/undotree",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    { 'HiPhish/rainbow-delimiters.nvim' }
    --  { "Olical/conjure" }
    -- {
    --    "Olical/conjure",
    --    ft = { "clojure" }, -- etc
    --    lazy = true,
    --    init = function()
    --        -- Set configuration options here
    --        -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
    --        -- This is VERY helpful when reporting an issue with the project
    --        -- vim.g["conjure#debug"] = true
    --    end,

    --    -- Optional cmp-conjure integration
    --    dependencies = { "PaterJason/cmp-conjure" },
    --},
    --{
    --    "PaterJason/cmp-conjure",
    --    lazy = true,
    --    config = function()
    --        local cmp = require("cmp")
    --        local config = cmp.get_config()
    --        table.insert(config.sources, { name = "conjure" })
    --        return cmp.setup(config)
    --    end,
    --},
    --{ 'tpope/vim-dispatch' },
    --{ 'clojure-vim/vim-jack-in' },
    --{ 'radenling/vim-dispatch-neovim' },
    --{
    --    'tpope/vim-eunuch',
    --    config = function()
    --        vim.cmd('cnoreabbrev rename Rename')
    --    end,
    --}
}
