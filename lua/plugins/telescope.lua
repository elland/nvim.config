return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_strategy = "flex",
      },

      pickers = {
        find_files = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        buffers = { theme = "ivy" },
        colorscheme = { theme = "ivy" },
        git_files = { theme = "ivy" },
        live_grep = { theme = "ivy" }
      }

    })

    telescope.load_extension("fzf")
  end,
}
