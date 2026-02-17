 return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   event = { "BufReadPost", "BufNewFile" },
   opts = {
     ensure_installed = { "java", "lua", "vim", "bash" },
     highlight = { enable = true },
     indent = { enable = true },
   },
 }
