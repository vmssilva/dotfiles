return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text", -- Adiciona valores das variáveis ao lado do código
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		-- 1. Texto Virtual (Valores de variáveis inline)
		require("nvim-dap-virtual-text").setup({
			commented = true, -- Mostra os valores como comentários
		})

		-- 2. Estilização de Ícones (Breakpoints e Seta de execução)
		-- Certifique-se de usar uma Nerd Font no terminal
		local symbols = {
			Breakpoint = { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" },
			BreakpointCondition = { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" },
			LogPoint = { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" },
			Stopped = { text = "", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "DiagnosticWarn" },
		}

		for name, opts in pairs(symbols) do
			vim.fn.sign_define("Dap" .. name, opts)
		end

		-- 3. Customização da UI (Cores e Ícones de Controle)
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "" },
			controls = {
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
			},
		})

		-- 4. Configurações de Java (Contexto do Buffer Atual)
		dap.configurations.java = {
			{
				type = "java",
				request = "launch",
				name = "Debug (Launch) - Buffer Atual",
				mainClass = function()
					return require("jdtls.util").resolve_classname()
				end,
				projectName = function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
				end,
			},
			{
				type = "java",
				request = "attach",
				name = "Debug (Attach) - Remote",
				hostName = "127.0.0.1",
				port = 5005,
			},
		}

		-- 5. Automação da UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.after.event_terminated["dap_cleanup"] = function()
			dap.repl.close()
			dap.close()
			dapui.close()
		end

		dap.listeners.after.event_exited["dap_cleanup"] = function()
			dap.repl.close()
			dap.close()
			dapui.close()
		end
	end,
}
--return {
--	"mfussenegger/nvim-dap",
--	dependencies = {
--		"rcarriga/nvim-dap-ui",
--		"nvim-neotest/nvim-nio",
--		"theHamsta/nvim-dap-virtual-text", -- Adiciona valores das variáveis ao lado do código
--	},
--	config = function()
--		local dap, dapui = require("dap"), require("dapui")
--
--		-- 1. Texto Virtual (Valores de variáveis inline)
--		require("nvim-dap-virtual-text").setup({
--			commented = true, -- Mostra os valores como comentários
--		})
--
--		-- 2. Estilização de Ícones (Breakpoints e Seta de execução)
--		-- Certifique-se de usar uma Nerd Font no terminal
--		local symbols = {
--			Breakpoint = { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" },
--			BreakpointCondition = { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" },
--			LogPoint = { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" },
--			Stopped = { text = "", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "DiagnosticWarn" },
--		}
--
--		for name, opts in pairs(symbols) do
--			vim.fn.sign_define("Dap" .. name, opts)
--		end
--
--		-- 3. Customização da UI (Cores e Ícones de Controle)
--		dapui.setup({
--			icons = { expanded = "▾", collapsed = "▸", current_frame = "" },
--			controls = {
--				icons = {
--					pause = "",
--					play = "",
--					step_into = "",
--					step_over = "",
--					step_out = "",
--					step_back = "",
--					run_last = "",
--					terminate = "",
--					disconnect = "",
--				},
--			},
--		})
--
--		-- 4. Configurações de Java (Contexto do Buffer Atual)
--		dap.configurations.java = {
--			{
--				type = "java",
--				request = "launch",
--				name = "Debug (Launch) - Buffer Atual",
--				mainClass = function()
--					return require("jdtls.util").resolve_classname()
--				end,
--				projectName = function()
--					return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
--				end,
--			},
--			{
--				type = "java",
--				request = "attach",
--				name = "Debug (Attach) - Remote",
--				hostName = "127.0.0.1",
--				port = 5005,
--			},
--		}
--
--		-- 5. Automação da UI
--		dap.listeners.after.event_initialized["dapui_config"] = function()
--			dapui.open()
--		end
--
--		dap.listeners.before.event_terminated["dapui_config"] = function()
--			dapui.close()
--		end
--		dap.listeners.before.event_exited["dapui_config"] = function()
--			dapui.close()
--		end
--	end,
--}
