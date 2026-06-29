local defaults = require("nvchad.configs.lspconfig")

local function lsp_keymaps(client, bufnr)
  local function opts(desc) return { buffer = bufnr, desc = "LSP " .. desc } end
  -- defaults.on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  vim.keymap.set("n", "<leader>vt", vim.lsp.buf.type_definition,
    opts "View type definition")
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts "View references")
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts "Hover documentation")

  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
    opts "View diagnostics")
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
    opts "Go to previous diagnostic")
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts "Go to next diagnostic")

  vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts "Code action")
  vim.keymap.set("n", "<leader>vrn", require("nvchad.lsp.renamer"),
    opts "Rename symbol")
  vim.keymap.set("n", "<leader>vf", vim.lsp.buf.format, opts "Format buffer")

  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts "Signature Help")
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts "Signature Help")
end

-- vim.lsp.config("*", {
--   capabilities = defaults.capabilities,
--   on_attach = lsp_keymaps,
-- })

vim.lsp.config("lua_ls", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps
})


vim.lsp.config("cmakelang", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
})

vim.lsp.config("clangd", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
})

vim.lsp.config("ruff", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
})

vim.lsp.config("pyright", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
})

vim.lsp.config("marksman", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
})

vim.lsp.config("neocmake", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,

  init_options = {
    buildDirectory = "build",
  },
})

vim.lsp.config("gopls", {
  capabilities = defaults.capabilities,
  on_attach = lsp_keymaps,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.lsp.enable({ "marksman", "gopls", "lua_ls", "clangd", "neocmake", "cmakelang", "ruff", "pyright" })
