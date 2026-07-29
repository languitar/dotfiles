return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine_b = opts.sections and opts.sections.lualine_b
      if lualine_b and lualine_b[1] then
        lualine_b[1] = {
          "branch",
          fmt = function(name)
            local width = vim.o.laststatus == 3 and vim.o.columns or vim.fn.winwidth(0)
            local max = width > 140 and 30 or 16
            if #name <= max then
              return name
            end
            return name:sub(1, max - 1) .. "…"
          end,
        }
      end

      local lualine_c = opts.sections and opts.sections.lualine_c
      if lualine_c and lualine_c[4] then
        lualine_c[4] = {
          "filename",
          path = 1,
          shorting_target = 80,
          symbols = {
            modified = "",
            readonly = " 󰌾 ",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        }
      end
    end,
  },
}
