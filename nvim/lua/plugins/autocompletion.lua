-- nvim/lua/plugins/autocompletion.lua
-- Blink.cmp - Configuración simplificada y funcional

return {
  "saghen/blink.cmp",
  version = "v0.*",
  event = "InsertEnter",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- Keymap preset
    keymap = { preset = "enter" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { enabled = true },

    completion = {
      menu = {
        border = "rounded",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = true },
    },
  },

  opts_extend = { "sources.default" },
}
