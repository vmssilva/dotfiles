local filters = vim.fn.stdpath("config") .. "/scripts/filters.sh"
vim.env.BASH_ENV = filters
-- vim.opt.shell = "bash"
-- vim.o.shellcmdflag=-ic
require("user.config.options.editor")
require("user.config.options.appearance")
require("user.config.options.lsp")
