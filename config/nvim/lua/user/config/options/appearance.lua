local opt = vim.opt
local diagnostic = vim.diagnostic
local api = vim.api
local cmd = vim.cmd
local _border = "rounded"

-- Divisórias mais finas e ocultação do '~' no fim do arquivo
opt.fillchars = {
  vert = '┃', -- Caractere fino e alto
  horiz = '━',
  eob = ' ', -- Limpa o fim dos buffers
}

-- Configuração de bordas arredondadas global para LSP (Hover, Signature)
opt.winborder = _border

-- Diagnósticos (Erros/Avisos) com bordas arredondadas
diagnostic.config({
  float = { border = _border },
})

-- Deixa a linha divisória (WinSeparator) discreta
api.nvim_set_hl(0, "WinSeparator", { fg = "#3b4261", bg = "none" })

-- Enable syntax highlighting
cmd [[ syntax enable ]]

--" Enable line search highlighting
cmd [[ set hlsearch ]]

--" Enable auto-indentation
cmd [[ filetype plugin indent on ]]

--" Enable 256 colors (if your terminal supports it)
cmd [[ set t_Co=256 ]]

--" Show matching parentheses, brackets, and braces
cmd [[ set showmatch ]]

--" Enable line numbers for the statusline
cmd [[ set statusline=%f ]]
