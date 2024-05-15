return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
  vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open neogit" })
}