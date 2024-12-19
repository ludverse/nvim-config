return {
	{
		"nvim-flutter/flutter-tools.nvim",
		ft = "dart",
		opts = {
			lsp = {
				-- settings = {
				--   showTodos = true,
				--   completeFunctionCalls = true,
				--   analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
				--   renameFilesWithClasses = "prompt", -- "always"
				--   enableSnippets = true,
				--   updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
				-- 				enableSdkFormatter = true,
				-- }
			}
		},
		keys = {
			{
				"<Leader>tl",
				":FlutterRun<CR>",
				silent = true,
				desc = "Launch flutter app"
			}
		}
	}
}
