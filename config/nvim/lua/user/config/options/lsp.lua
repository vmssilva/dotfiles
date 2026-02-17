vim.o.updatetime = 500

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      source = "always",
    })
  end,
})

-- 🔥 Ativar inlay hints quando LSP conectar
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then return end

    -- Ativar Inlay Hints automaticamente
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end

    -- Ativar CodeLens automaticamente
    if client.server_capabilities.codeLensProvider then
      vim.lsp.codelens.refresh({ bufnr = args.buf })
    end
  end,

})

-- Ativar CodeLens automaticamente
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
  callback = function(args)
    vim.lsp.codelens.refresh({ bufnr = args.buf })
  end,
})

