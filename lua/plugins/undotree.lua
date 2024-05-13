return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set('n', "<leader>5", vim.cmd.UndotreeToggle)
  end
}
