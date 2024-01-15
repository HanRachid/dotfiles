local plugins = {
  {
    "vim-crystal/vim-crystal",
    lazy = false,
  },
  { "dense-analysis/ale" },
  {
    "barrett-ruth/live-server.nvim",
    build = "yarn global add live-server",
    config = true,
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "0x00-ketsu/autosave.nvim",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "JuanDAC/betty-ale-vim",
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        python = { "autopep8", "yapf" },
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        c = { "clang_format" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true, quiet = true },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        "clang-format",
      },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
  },
  init = function() -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_env_variable_url = "mysql://localhost:3306"
    vim.api.nvim_set_var("ale_linters", {
      c = { "betty-style", "betty-doc", "gcc" },
    })
  end,
}
return plugins
