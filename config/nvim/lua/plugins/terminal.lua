return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-_>]], -- Atalho estilo VSCode
      direction = "horizontal", -- abre embaixo
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shade_terminals = true,
      shell = vim.o.shell,
      --size = 15, -- altura do terminal
      size = function()
        return math.floor(vim.o.lines * 0.3)
      end, -- altura do terminal
    })

    -- Atalhos dentro do terminal
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }

      -- Sair do modo terminal
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

      -- Navegação entre janelas
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}


--return {
--  "akinsho/toggleterm.nvim",
--  version = "*",
--  config = function()
--    require("toggleterm").setup({
--      size = 20,
--      -- Atalho global para abrir/fechar o terminal
--      open_mapping = [[<c-\>]], 
--      hide_numbers = true,
--      shade_terminals = true,
--      shading_factor = 2,
--      start_in_insert = true,
--      insert_mappings = true,
--      persist_size = true,
--      direction = "float", -- Define como flutuante por padrão
--      close_on_exit = true,
--      shell = vim.o.shell,
--      float_opts = {
--        border = "rounded", -- Bordas arredondadas para combinar com o resto da IDE
--        winblend = 3,       -- Leve transparência
--      },
--    })
--
--    -- Atalhos úteis dentro do terminal
--    function _G.set_terminal_keymaps()
--      local opts = {buffer = 0}
--      -- Esc para sair do modo de inserção no terminal (opcional)
--      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--
--      -- Navegação entre janelas a partir do terminal
--      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
--      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
--      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
--      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
--    end
--
--    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--  end,
--  keys = {
--    -- Atalho alternativo usando o Leader
--    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Flutuante" },
--  }
--}
