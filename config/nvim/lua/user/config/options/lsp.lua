vim.o.updatetime = 500

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			border = "rounded",
			source = "always",
		})
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		-- Pega todos os clientes LSP ativos para este buffer
		local clients = vim.lsp.get_clients({ bufnr = bufnr })

		for _, client in ipairs(clients) do
			-- Verifica se suporta Inlay Hints
			if client.supports_method("textDocument/inlayHint") then
				local ok = pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
				if not ok then
					-- fallback para versões antigas
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end

			-- Verifica se suporta CodeLens
			if client.supports_method("textDocument/codeLens") then
				vim.lsp.codelens.refresh({ bufnr = bufnr })
			end
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
	callback = function(args)
		local bufnr = args.buf
		local clients = vim.lsp.get_clients({ bufnr = bufnr })
		local filename = vim.fn.expand("%:t")
		local types = { "lua", "dart" } -- extensões

		-- Se não houver clientes ativos
		if #clients == 0 then
			for _, ext in ipairs(types) do
				-- Escapa o ponto na extensão
				if string.match(filename, "^.+%." .. ext .. "$") then
					-- Tenta habilitar LSPs já configurados
					-- Substitua pelos servidores que você usa
					for _, server in ipairs({ "lua_ls" }) do
						-- Só ativa se não estiver ativo
						local is_active = false
						for _, c in ipairs(vim.lsp.get_clients()) do
							if c.name == server then
								is_active = true
								break
							end
						end
						if not is_active then
							pcall(vim.lsp.enable, server)
						end
					end
				end
			end
			-- Atualiza lista de clientes após tentar ativar
			clients = vim.lsp.get_clients({ bufnr = bufnr })
		end

		-- Atualiza CodeLens apenas se algum cliente suportar
		for _, client in ipairs(clients) do
			if client.supports_method("textDocument/codeLens") then
				vim.lsp.codelens.refresh({ bufnr = bufnr })
			end
		end
	end,
})
