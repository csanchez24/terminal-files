-- nvim/lua/plugins/yazi.lua
-- Yazi file manager integration with Neovim
-- https://github.com/mikavilpas/yazi.nvim

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>sy",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at current file",
    },
    {
      "<leader>sY",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in nvim's working directory",
    },
  },
  opts = {
    -- Open yazi instead of netrw for directories
    open_for_directories = false,

    -- Keymaps inside yazi
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "<c-v>",
      open_file_in_horizontal_split = "<c-x>",
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-s>",
      replace_in_directory = "<c-g>",
      cycle_open_buffers = "<tab>",
      copy_relative_path_to_selected_files = "<c-y>",
      send_to_quickfix_list = "<c-q>",
    },

    -- Floating window config
    yazi_floating_window_winblend = 0,
    yazi_floating_window_border = "rounded",
  },
}
