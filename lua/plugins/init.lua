return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

	{
    'numToStr/Comment.nvim',
    opts ={},
    config = function ()
      require("Comment").setup()
    end,
    lazy = false
  },

  {
    "neovim/nvim-lspconfig",
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua", "html-lsp", "css-lsp" , "prettier", "clangd", "tinymist"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
				"vim", "lua", "vimdoc", "cpp"
			},
  	},
  },
}
