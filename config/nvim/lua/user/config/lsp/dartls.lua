vim.lsp.config("dart_ls", {
	cmd = { "dart", "language-server", "--protocol=lsp" },
	filetypes = { "dart" },
	root_markers = { "pubspec.yaml", ".git" },

	init_options = {
		closingLabels = true,
		flutterOutline = true,
		onlyAnalyzeProjectsWithOpenFiles = true,
		suggestFromUnimportedLibraries = true,
	},

	settings = {
		dart = {
			completeFunctionCalls = true,
			showTodos = true,
			inlayHints = {
				parameterNames = "all", -- none | literals | all
				parameterTypes = true,
				variableTypes = true,
				propertyDeclarationTypes = true,
				functionReturnTypes = true,
			},
		},
	},
})

vim.lsp.enable("dart_ls")
