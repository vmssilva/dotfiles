local keymap = vim.keymap.set

-- Breakpoints
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
keymap("n", "<leader>dB", "<cmd>DapSetBreakpoint<CR>", { desc = "Breakpoint Condicional" })
keymap("n", "<leader>dx", "<cmd>DapClearBreakpoints<CR>", { desc = "Clear Breakpoint" })

-- Execução
keymap("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Start/Continue" })
keymap("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
keymap("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
keymap("n", "<F12>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })

-- Finalizar / Reiniciar
keymap("n", "<leader>dq", "<cmd>DapTerminate<CR>", { desc = "Terminate Debug" })
keymap("n", "<leader>dr", "<cmd>DapRestart<CR>", { desc = "Restart Debug" })

-- REPL
keymap("n", "<leader>di", "<cmd>DapToggleRepl<CR>", { desc = "Toggle REPL" })
keymap("n", "<leader>dl", "<cmd>DapRunLast<CR>", { desc = "Run Last" })
