return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Ícones Nerd Fonts
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Fecha o Neovim se a última janela for o Neo-tree
			popup_border_style = "rounded", -- Bordas arredondadas para combinar com sua IDE

			filesystem = {
				follow_current_file = {
					enabled = true, -- Foca automaticamente no arquivo que você está editando
				},
				use_libuv_file_watcher = true, -- Atualiza a árvore automaticamente se arquivos mudarem no sistema
			},

			window = {
				width = 30, -- Largura da barra lateral
				mappings = {
					["<space>"] = "none", -- Desabilita espaço para não dar conflito com o seu Leader
				},
			},

			default_component_configs = {
				indent = {
					with_expanders = true, -- Adiciona ícones de (+) e (-) para pastas
					expander_collapsed = "",
					expander_expanded = "",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					default = "󰈚",
				},
			},
		})
	end,
	keys = {
		-- Atalho principal para abrir/fechar o explorador
		{ "<C-w>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
	},
}
