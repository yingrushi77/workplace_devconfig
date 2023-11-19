
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
-- 
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 要加载的插件配置
-- 目前先放在这里，plugins文件夹下目前有问题，后面解决了统一迁移过去

-- 1> 主题插件 tokyonight
local plugin_tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

-- 2> 侧边栏插件 nvim-tree
local plugin_nvim_tree = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("plugin-config.nvim-tree")
    end
}

-- 3> 导航栏插件 bufferline
local plugin_bufferline = {'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("plugin-config.bufferline")
    end
}

-- 关闭buffer插件
local plugin_vim_bbye = {
	"moll/vim-bbye"
}

-- 4> 底部状态栏 lualine
local plugin_lualine = {
	'nvim-lualine/lualine.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
        require("plugin-config.lualine")
    end
}

-- 5> 模糊搜索 telescope
local plugin_telescope = {
    'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
-- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
        require("plugin-config.telescope")
    end
}

local plugin_telescope_extension1 = {
	"LinArcX/telescope-env.nvim"
}

local plugin_telescope_extension2 = {
	"nvim-telescope/telescope-ui-select.nvim"
}

-- 6> 启动页插件 dashboard
local plugin_dashboard = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
	  require("plugin-config.dashboard")
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

-- 7> 高亮增强插件 nvim-treesitter
local plugin_nvim_treesitter = {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("plugin-config.nvim-treesitter")
	end,
	dependancies = {
		{ "p00f/nvim-ts-rainbow" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/nvim-treesitter-textobjects" }
	}
}

-- 8> 项目插件 project
local plugin_project = {
	"ahmedkhalf/project.nvim",
	config = function()
		require("plugin-config.project")
	end
}

-- 9> 代码补全/提示插件
local plugin_nvim_lsp_installer = {
	"williamboman/mason.nvim"
}

local plugin_nvim_lspconfig = {
	"williamboman/mason-lspconfig.nvim"
}

local plugin_nvim_lspconfig1 = {
	"neovim/nvim-lspconfig"
}

-- 10> 补全/代码段插件
-- 补全引擎
local plugin_nvim_cmp = {
	"hrsh7th/nvim-cmp"
}

-- Snippet引擎
local plugin_snippet = {
	{
		"L3MON4D3/LuaSnip"
	},
	{
		"saadparwaiz1/cmp_luasnip"
	}
}

-- 补全源
local plugin_nvim_vsnip = {
	{
		"hrsh7th/vim-vsnip"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"hrsh7th/cmp-cmdline"
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help"
	}
}

-- 常见语言代码段插件
local plugin_friendly_snippets = {
	"rafamadriz/friendly-snippets"
}

-- 11> 增强插件
-- lua增强
local plugin_neodev = {
	"folke/neodev.nvim"
}

-- UI增强
local plugin_blankline = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("plugin-config.indent-blankline")
	end
}

-- UI增强
local plugin_lspsaga = {
	"tami5/lspsaga.nvim"
}

-- 注释插件
local plugin_comment = {
	"numToStr/Comment.nvim",
	config = function()
		require("plugin-config.comment")
	end
}

-- autopair
local plugin_autopair = {
	"windwp/nvim-autopairs",
	config = function()
		require("plugin-config.nvim-autopairs")
	end
}

-- 12>terminal插件
local plugin_toggleterm = {
	"akinsho/toggleterm.nvim",
	config = function()
		require("plugin-config.toggleterm")
	end
}

local plugins_table = {
	plugin_tokyonight,
	plugin_nvim_tree,
	plugin_bufferline,
	plugin_lualine,
	plugin_dashboard,
	plugin_telescope,
	plugin_nvim_treesitter,
	plugin_telescope_extension1,
	plugin_telescope_extension2,
	plugin_project,
	plugin_nvim_lsp_installer,
	plugin_nvim_lspconfig,
	plugin_nvim_lspconfig1,
	plugin_neodev,
	plugin_nvim_cmp,
	plugin_snippet,
	plugin_nvim_vsnip,
	plugin_friendly_snippets,
	plugin_vim_bbye,
	plugin_blankline,
	plugin_lspsaga,
	plugin_comment,
	plugin_autopair,
	plugin_toggleterm
}
-- 4. 加载lazy.nvim模块
require("lazy").setup(plugins_table)

