local keymap = vim.keymap
local diagnostic = vim.diagnostic

keymap.set("n", "<leader>de", diagnostic.open_float)
keymap.set("n", "<leader>dE", diagnostic.setloclist)
keymap.set("n", "<leader>dl", diagnostic.setqflist)

-- Executar CodeLens ao pressionar
-- vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { buffer = vim.fn.bufnr("%") })

keymap.set("n", "[d", diagnostic.goto_prev)
keymap.set("n", "]d", diagnostic.goto_next)

-- CODE ACTIONS
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "All Code Actions" })
keymap.set("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions (Selection)" })

keymap.set(
	"n",
	"<leader>cr",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'refactor' } } })<CR>",
	{ desc = "Refactor" }
)

keymap.set(
	"n",
	"<leader>cs",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } } })<CR>",
	{ desc = "Source Actions" }
)

keymap.set(
	"n",
	"<leader>cq",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'quickfix' } } })<CR>",
	{ desc = "Quick Fix" }
)

keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
