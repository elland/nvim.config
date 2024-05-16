-- Neogit, magit for neovim
return {
	'NeogitOrg/neogit',
	branch = 'nightly',
	dependencies = {
		'nvim-lua/plenary.nvim',           -- required
		'sindrets/diffview.nvim',          -- optional - Diff integration

		'nvim-telescope/telescope.nvim',   -- optional
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup {
			graph_style = 'unicode',
			remember_settings = false,
			signs = {
				-- { CLOSED, OPENED }
				hunk = { ">", "v" },
				item = { "", "" },
				section = { "", "" },
			},

		}
	end,
	vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open neo[g]it, not ma[g]it' }),
}
