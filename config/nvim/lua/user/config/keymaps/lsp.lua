local keymap = vim.keymap.set
local diagnostic = vim.diagnostic

-- Tests
vim.keymap.set("n", "<leader>tn", function()
	require("jdtls").test_nearest_method()
end)

vim.keymap.set("n", "<leader>tc", function()
	require("jdtls").test_class()
end)

keymap("n", "<leader>de", diagnostic.open_float)
keymap("n", "<leader>dE", diagnostic.setloclist)
keymap("n", "<leader>dl", diagnostic.setqflist)

-- Executar CodeLens ao pressionar
-- vim.keymap("n", "<leader>cl", vim.lsp.codelens.run, { buffer = vim.fn.bufnr("%") })

keymap("n", "[d", diagnostic.goto_prev)
keymap("n", "]d", diagnostic.goto_next)

-- CODE ACTIONS
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "All Code Actions" })
keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions (Selection)" })

keymap(
	"n",
	"<leader>cr",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'refactor' } } })<CR>",
	{ desc = "Refactor" }
)

keymap(
	"n",
	"<leader>cs",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'source' } } })<CR>",
	{ desc = "Source Actions" }
)

keymap(
	"n",
	"<leader>cq",
	"<cmd>lua vim.lsp.buf.code_action({ context = { only = { 'quickfix' } } })<CR>",
	{ desc = "Quick Fix" }
)

keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" })
keymap("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
