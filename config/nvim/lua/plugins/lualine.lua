return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
        globalstatus = true, -- statusline única
      },

      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },

        lualine_b = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },
        },

        lualine_c = {
          {
            function()
              if vim.bo.buftype == "terminal" then
                return "  Terminal"
              else
                return vim.fn.expand("%:t")
              end
            end,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
              },
            },
          },

          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn  = " ",
                info  = " ",
                hint  = "󰌵 ",
              },
            },
            {
              "filetype",
              icon_only = true,
            },
          },

          lualine_y = {
            { "progress" },
          },

          lualine_z = {
            { "location" },
          },
        },
      })
    end
  }
