return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "mfussenegger/nvim-dap",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local jdtls = require("jdtls")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local mason_path = vim.fn.stdpath("data").. "/mason/packages"
    local root_markers = { "pom.xml", "build.gradle", ".git" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    if not root_dir then return end

    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    -- CONFIGURAÇÃO DOS BUNDLES (DEBUG E TEST)
    local bundles = {}
    -- Carrega o Debug Adapter
    local java_debug_path = mason_path.. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
    vim.list_extend(bundles, vim.fn.glob(java_debug_path, true, true))

    -- Carrega as extensões de Teste (importante para o neotest e para debugar testes)
    local java_test_path = mason_path.. "/java-test/extension/server/*.jar"
    vim.list_extend(bundles, vim.fn.glob(java_test_path, true, true))

    local config = {
      cmd = { mason_path.. "/jdtls/bin/jdtls", "-data", workspace_dir },
      root_dir = root_dir,
      capabilities = cmp_nvim_lsp.default_capabilities(),
      init_options = {
        bundles = bundles -- Aqui o JDTLS carrega o suporte ao debug
      },
      settings = {
        java = {
          completion = { favoriteStaticMembers = { "java.util.Objects.requireNonNull" } },
          signatureHelp = { enabled = true },
          inlayHints = {
            parameterNames = {
              enabled = "all" -- options: none, literal, all
            }
          }
        }
      },
      -- Função que roda quando o LSP conecta no buffer
      on_attach = function(client, bufnr)
        -- REGISTRA O ADAPTADOR AUTOMATICAMENTE
        -- Isso substitui a necessidade de configurar dap.adapters.java manualmente
        jdtls.setup_dap({ hotcodereplace = "auto" })

        -- Opcional: descobre classes main automaticamente para o comando :DapNew
        require('jdtls.dap').setup_dap_main_class_configs()

        -- Keymaps específicos de Java
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>co", jdtls.organize_imports, bufopts)
        vim.keymap.set("n", "<leader>jt", jdtls.test_class, bufopts)
        vim.keymap.set("n", "<leader>jm", jdtls.test_nearest_method, bufopts)
      end
    }

    jdtls.start_or_attach(config)
  end,
}
