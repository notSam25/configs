-- debugger.lua

return {
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
  },
  {
    -- usefull commands https://github.com/lervag/vimtex/blob/master/test/example-quick-start/main.tex
    "lervag/vimtex",
    lazy = false,  -- we don't want to lazy load VimTeX
    tag = "v2.17", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = {
          "--quiet",
          "--interpreter=dap",
          "--eval-command", "set print pretty on",
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          setupCommands = {
            {
              text = "set output-radix 16",
              description = "Use hex for integers",
              ignoreFailures = false,
            },
          },
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({
        expand_lines = true,
        controls = {
          enabled = false,
        },
        layouts = {
          {
            position = "left",
            size = 35,
            elements = {
              { id = "scopes",      size = 0.50 },
              { id = "breakpoints", size = 0.50 },
            },
          },
          {
            position = "bottom",
            size = 12,
            elements = {
              { id = "repl",   size = 0.50 },

              { id = "stacks", size = 0.50 },
            },
          },
        },
      })
      vim.api.nvim_set_hl(0, "DapBreakpoint", {
        fg = "#ff0000",
      })

      vim.api.nvim_set_hl(0, "DapBreakpointCondition", {
        fg = "#ff8800",
      })

      vim.api.nvim_set_hl(0, "DapStopped", {
        fg = "#00ff00",
      })

      vim.api.nvim_set_hl(0, "DapStoppedLine", {
        bg = "#3a1f1f",
      })
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "",
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
}
