local keymap = vim.keymap.set

-- Arquivos
keymap("n", "<space>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
keymap("n", "<space>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keymap("n", "<space>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap("n", "<space>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })

-- Find all files (incluindo hidden)
keymap("n", "<space>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", { desc = "Find All Files" })

-- Find all files (Config directory)
keymap("n", "<space>fc", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find Files" })

-- LSP Java
keymap("n", "<space>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to Definition" })
keymap("n", "<space>gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
keymap("n", "<space>gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
keymap("n", "<space>gs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
keymap("n", "<space>gS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })

-- DAP (precisa do telescope-dap)
--keymap("n", "<space>df", "<cmd>Telescope dap frames<cr>", { desc = "DAP Frames" })
--keymap("n", "<space>dv", "<cmd>Telescope dap variables<cr>", { desc = "DAP Variables" })
keymap("n", "<space>dl", "<cmd>Telescope dap list_breakpoints<cr>", {})
keymap("n", "<space>dc", "<cmd>Telescope dap configurations<cr>", {})
