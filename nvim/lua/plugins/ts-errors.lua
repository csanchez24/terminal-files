return {
  "dmmulroy/ts-error-translator.nvim",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function()
    require("ts-error-translator").setup({
      -- Auto-attach to LSP servers for TypeScript diagnostics (default: true)
      auto_attach = true,

      -- LSP server names to translate diagnostics for
      servers = {
        "astro",
        "svelte",
        "ts_ls",
        "tsserver",
        "typescript-tools",
        "volar",
        "vtsls",
      },
    })
  end,
}
