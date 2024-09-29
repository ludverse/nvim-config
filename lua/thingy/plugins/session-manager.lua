return {
	{
		"Shatur/neovim-session-manager",
		commit = "a0b9d25", -- in later commits they require nvim 0.10.0 because they hate humanity
		lazy = false,

		keys = {
			{
				"<Leader>ss",
				function() require("session_manager").load_session() end,
				desc = "Load session"
			},
			{
				"<Leader>sw",
				function() require("session_manager").save_current_session() end,
				desc = "Save current session"
			}
		},

		config = function()
			local config = require("session_manager.config")

			require("session_manager").setup({
				autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession },
				autosave_only_in_session = true,
			})
		end
	},
}
