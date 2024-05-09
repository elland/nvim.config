return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    defaults = {
      ["<leader>f"] = { name = "+find" },
      ["<leader>e"] = { name = "+file" },
      ["<leader>t"] = { name = "+tabs" },
      ["<leader>s"] = { name = "+splits" },
    }
  }
}
