-- Highlight on yank.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  group = vim.api.nvim_create_augroup("nifty", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
