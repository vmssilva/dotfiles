vim.lsp.config("emmet_ls", {
    filetypes = {
        "html",
        "css",
        "xml",
        "javascriptreact",
        "typescriptreact",
    },
})

vim.lsp.enable("emmet_ls")
