return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore",
            "--glob",
            "!.git",
            "--glob",
            "!node_modules",
          },
        },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    },
  },
  require "plugins.debugger",
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint"
      },

      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue"
      },

      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor"
      },

      {
        "<leader>dT",
        function() require("dap").terminate() end,
        desc = "Terminate"
      },
    },
  }
}
