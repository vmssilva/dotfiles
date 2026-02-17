local keymap = vim.keymap

-- Breakpoints
keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dB", "<cmd>DapSetBreakpoint<CR>", { desc = "Breakpoint Condicional" })
keymap.set("n", "<leader>dx", "<cmd>DapClearBreakpoints<CR>", { desc = "Clear Breakpoint" })

-- Execução
keymap.set("n", "<F5>",  "<cmd>DapContinue<CR>", { desc = "Start/Continue" })
keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
keymap.set("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
keymap.set("n", "<F12>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })

-- Finalizar / Reiniciar
keymap.set("n", "<leader>dq", "<cmd>DapTerminate<CR>", { desc = "Terminate Debug" })
keymap.set("n", "<leader>dr", "<cmd>DapRestart<CR>", { desc = "Restart Debug" })

-- REPL
keymap.set("n", "<leader>di", "<cmd>DapToggleRepl<CR>", { desc = "Toggle REPL" })
keymap.set("n", "<leader>dl", "<cmd>DapRunLast<CR>", { desc = "Run Last" })

