vim.lsp.config("bashls", {
	settings = {
		bashIde = {
			shellcheckPath = "shellcheck",
			--shellcheckArguments = { "-x" },
		},
	},
})

vim.lsp.enable("bashls")
