local keymap = vim.keymap

-- Redimensionar janelas
keymap.set("n", "<C-h>", "<cmd>vertical resize -2<CR>", { desc = "Diminuir largura" })
keymap.set("n", "<C-l>", "<cmd>vertical resize +2<CR>", { desc = "Aumentar largura" })
keymap.set("n", "<C-j>", "<cmd>resize -2<CR>", { desc = "Diminuir altura" })
keymap.set("n", "<C-k>", "<cmd>resize +2<CR>", { desc = "Aumentar altura" })

-- Mover Linhas
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover linha para baixo" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover linha para cima" })

keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Mover linha para baixo" })
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Mover linha para cima" })

keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })

-- Trabalhar com Buffers
keymap.set("n", "<C-w>t", "<cmd> tabnew<CR>", {desc = "Open new tab"})
keymap.set("n", "<C-w>d", "<cmd> bd<CR>", {desc = "Delete Buffer"})
keymap.set("n", "<C-w>s", "<cmd> write<CR>", {desc = "Save"})
keymap.set("n", "<C-w>q", "<cmd> quit<CR>", {desc = "Quit"})
keymap.set("n", "<C-w>x", "<cmd> quitall<CR>", {desc = "Quitall"})
keymap.set("n", "<C-w>k", "<cmd> quitall!<CR>", {desc = "Quitall (Brute force)"})

-- Navegacao entre tabelas
keymap.set("n", "[t", "<cmd> tabprevious<CR>", {desc = "Previous tab"})
  keymap.set("n", "]t", "<cmd> tabnext<CR>", {desc = "Next tab"})
