vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				paramType = true,
				paramName = "All",
				setType = true,
			},
		},
	},
})

vim.lsp.enable("lua_ls")
