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
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "vim", "vimdoc", "query", "typescript", "javascript", "tsx", "html" },
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
    { 'lewis6991/gitsigns.nvim' },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-jest",
        },
        requires = {
            'nvim-neotest/neotest-jest'
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-jest')({
                        jestCommand = "pnpm exec nx run module-namee:test --",
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    }),
                }
            })
        end
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
