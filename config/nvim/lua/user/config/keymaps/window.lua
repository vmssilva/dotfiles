local keymap = vim.keymap.set

-- ToggleTerm
keymap("n", "<C-/>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
keymap("i", "<C-/>", "<Esc><cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
keymap("t", "<C-/>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "Toggle terminal" })

-- Leader shortcuts
keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Terminal toggle" })
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal floating" })

keymap("n", "<C-/>", "<cmd>ToggleTerm<CR>")
keymap("i", "<C-/>", "<Esc><cmd>ToggleTerm<CR>")
keymap("t", "<C-/>", [[<C-\><C-n><cmd>ToggleTerm<CR>]])

-- Redimensionar janelas
keymap("n", "<C-h>", "<cmd>vertical resize -2<CR>", { desc = "Diminuir largura" })
keymap("n", "<C-l>", "<cmd>vertical resize +2<CR>", { desc = "Aumentar largura" })
keymap("n", "<C-j>", "<cmd>resize -2<CR>", { desc = "Diminuir altura" })
keymap("n", "<C-k>", "<cmd>resize +2<CR>", { desc = "Aumentar altura" })

-- Mover Linhas
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover linha para baixo" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover linha para cima" })

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Mover linha para baixo" })
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Mover linha para cima" })

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })

-- Trabalhar com Buffers
keymap("n", "<C-w>t", "<cmd> tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<C-w>d", "<cmd> bd<CR>", { desc = "Delete Buffer" })
keymap("n", "<C-w>w", "<cmd> write<CR>", { desc = "Save" })
keymap("n", "<C-w>q", "<cmd> quit<CR>", { desc = "Quit" })
keymap("n", "<C-w>x", "<cmd> quitall<CR>", { desc = "Quitall" })
keymap("n", "<C-w>k", "<cmd> quitall!<CR>", { desc = "Quitall (Brute force)" })

-- Navegacao entre tabelas
keymap("n", "[t", "<cmd> tabprevious<CR>", { desc = "Previous tab" })
keymap("n", "]t", "<cmd> tabnext<CR>", { desc = "Next tab" })

-- Clear HLSEARCH
keymap("n", "<space>c", "<cmd>noh<CR>", {})
