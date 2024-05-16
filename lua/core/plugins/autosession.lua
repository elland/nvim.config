-- Auto-Session, remembers cursor, buffers…
return {
	'rmagatti/auto-session',
	config = function()
		local auto_session = require 'auto-session'

		auto_session.setup {
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop/' },
		}

		local keymap = vim.keymap

		keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = '[W]indow Session [r]estore' })
		keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = '[W]indow Session [s]ave' })
	end,
}
