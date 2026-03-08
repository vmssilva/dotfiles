return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local home = os.getenv("HOME")
		local jdtls = require("jdtls")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
		local root_markers = { "pom.xml", "build.gradle", ".git" }
		local root_dir = require("jdtls.setup").find_root(root_markers)

		if not root_dir then
			return
		end

		local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

		local bundles = {}

		-- Java Debug Bundle
		local java_debug_bundles =
			{ mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar" }

		-- Java Test Bundles
		local java_test_bundles = {
			mason_path .. "/java-test/extension/server/com.microsoft.java.test.plugin-0.43.1.jar",
			mason_path .. "/java-test/extension/server/com.microsoft.java.test.runner-jar-with-dependencies.jar",
			mason_path .. "/java-test/extension/server/jacocoagent.jar", -- opcional
		}

		vim.list_extend(bundles, java_debug_bundles)
		vim.list_extend(bundles, java_test_bundles)

		local config = {
			cmd = {
				mason_path .. "/jdtls/bin/jdtls",
				"-data",
				workspace_dir,
				"--enable-preview",
			},

			--cmd = {
			--	"/home/dida/.local/lib/jvm/jdk-25.0.1/bin/java", -- JVM correta
			--	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			--	"-Dosgi.bundles.defaultStartLevel=4",
			--	"-Declipse.product=org.eclipse.jdt.ls.core.product",
			--	"-Dlog.level=ALL",
			--	"-Xms1g",
			--	"--add-modules=ALL-SYSTEM",
			--	"--add-opens",
			--	"java.base/java.util=ALL-UNNAMED",
			--	"-jar",
			--	mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
			--	"-configuration",
			--	mason_path .. "/jdtls/config_linux", -- ajuste conforme seu SO
			--	"-data",
			--	workspace_dir,
			--	"--enable-preview", -- habilita switch -> e outras preview features
			--	"-source",
			--	"25", -- força a linguagem Java 25
			--},

			root_dir = root_dir,
			capabilities = cmp_nvim_lsp.default_capabilities(),
			init_options = {
				bundles = bundles, -- Aqui o JDTLS carrega o suporte ao debug
			},
			settings = {
				java = {
					completion = { favoriteStaticMembers = { "java.util.Objects.requireNonNull" } },
					signatureHelp = { enabled = true },
					referencesCodeLens = { enabled = true },
					implementationsCodeLens = { enabled = true },
					inlayHints = {
						parameterNames = {
							enabled = "all", -- options: none, literal, all
						},
					},
					configuration = {
						runtimes = {
							{
								name = "JavaSE-1.8",
								path = home .. "/.local/lib/jvm/java-se-8u44-ri",
							},
							{
								name = "JavaSE-11",
								path = home .. "/.local/lib/jvm/jdk-11.0.0.2",
							},
							{
								name = "JavaSE-21",
								path = home .. "/.local/lib/jvm/jdk-21",
							},
							{
								name = "JavaSE-22",
								path = home .. "/.local/lib/jvm/jdk-22.0.1",
							},
							{
								name = "JavaSE-25",
								path = home .. "/.local/lib/jvm/jdk-25.0.1",
								default = true,
							},
						},
					},
					compiler = {
						complianceLevel = "25",
						release = "25",
					},
				},
			},
			on_attach = function(client, bufnr)
				-- REGISTRA O ADAPTADOR AUTOMATICAMENTE
				-- Isso substitui a necessidade de configurar dap.adapters.java manualmente
				jdtls.setup_dap({ hotcodereplace = "auto" })

				-- Opcional: descobre classes main automaticamente para o comando :DapNew
				require("jdtls.dap").setup_dap_main_class_configs()

				-- Keymaps específicos de Java
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "<leader>co", jdtls.organize_imports, bufopts)
				vim.keymap.set("n", "<leader>jt", jdtls.test_class, bufopts)
				vim.keymap.set("n", "<leader>jm", jdtls.test_nearest_method, bufopts)
			end,
		}

		jdtls.start_or_attach(config)
	end,
}
