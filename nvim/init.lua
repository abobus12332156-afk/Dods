-- =========================
-- Basic settings
-- =========================

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"


-- =========================
-- Keybinds
-- =========================

local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

map("n", "<leader>h", ":nohlsearch<CR>")

-- Быстрое перемещение между окнами
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Выход из insert
map("i", "jk", "<Esc>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>r", ":NvimTreeRefresh<CR>")
map("n", "<leader>n", ":NvimTreeFindFile<CR>")

-- =========================
-- Lazy.nvim plugin manager
-- =========================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

    -- Тема
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },


    -- Иконки
    {
        "nvim-tree/nvim-web-devicons"
    },


    -- Файловый менеджер
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end
    },


    -- Красивый статусбар
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
        end
    },


    -- Поиск
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },


    -- Подсветка синтаксиса
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },


    -- LSP
{
    "neovim/nvim-lspconfig",
},

{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end,
},

{
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "ts_ls",
                "clangd",
                "html",
                "cssls",
            }
        })

        local capabilities =
            require("cmp_nvim_lsp").default_capabilities()


        -- Lua
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
        })

        vim.lsp.enable("lua_ls")


        -- Rust
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
        })

        vim.lsp.enable("rust_analyzer")


        -- Python
        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        vim.lsp.enable("pyright")


        -- TypeScript
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        vim.lsp.enable("ts_ls")


        -- C/C++
        vim.lsp.config("clangd", {
            capabilities = capabilities,
        })

        vim.lsp.enable("clangd")


        -- GLSL
        vim.lsp.config("glsl_analyzer", {
            capabilities = capabilities,

            cmd = {
                "glsl_analyzer",
            },

            filetypes = {
                "glsl",
                "vert",
                "frag",
                "comp",
                "geom",
                "tesc",
                "tese",
            },

            root_markers = {
                ".git",
                "CMakeLists.txt",
            },
        })

        vim.lsp.enable("glsl_analyzer")

        -- HTML
vim.lsp.config("html", {
    capabilities = capabilities,
})

vim.lsp.enable("html")


-- CSS
vim.lsp.config("cssls", {
    capabilities = capabilities,
})

vim.lsp.enable("cssls")

    end
},
-- Mini.pairs
{
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
    config = function()
        require("mini.pairs").setup()
    end,
},


-- Автодополнение
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp = require("cmp")

        cmp.setup({

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

	    view = {
                entries = {
                    name = "custom",
                    selection_order = "near_cursor",
                },
            },

            window = {
                completion = {
                    scrollbar = false,
                },
            },

            performance = {
                max_view_entries = 10,
            },



            mapping = cmp.mapping.preset.insert({

                -- вниз/вверх по списку
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),

                -- вставить выбранное
                ["<CR>"] = cmp.mapping.confirm({
                    select = true,
                }),

                -- открыть подсказки вручную
                ["<C-Space>"] = cmp.mapping.complete(),

            }),


            sources = cmp.config.sources({

                {
                    name = "nvim_lsp"
                },

                {
                    name = "path"
                },

            }, {

                {
                    name = "buffer"
                }

            }),
	})
    end
},
})


-- =========================
-- Theme
-- =========================

vim.cmd.colorscheme("catppuccin")


