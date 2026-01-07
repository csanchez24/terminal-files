return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {
        TelescopePrompt = true,
        gitcommit = true,
        markdown = true,
        dotenv = true,
        env = true,
        codecompanion = true,
      },
      color = {
        suggestion_color = "#708CA9", -- Dracula Pro comment color
        cterm = 244,
      },
      log_level = "off",
    })
  end,
}
