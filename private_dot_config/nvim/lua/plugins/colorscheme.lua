return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local tokyonight = require("tokyonight")
        tokyonight.setup({
          on_colors = function(c)
            c.border = c.blue0
          end,
          on_highlights = function(hl, c)
            if vim.fn.has("wsl") == 1 then
              hl.SpellBad = { sp = c.error, undercurl = false, underline = true }
              hl.SpellCap = { sp = c.warning, undercurl = false, underline = true }
              hl.SpellLocal = { sp = c.info, undercurl = false, underline = true }
              hl.SpellRare  = { sp = c.hint, undercurl = false, underline = true }
            end
          end
        })
        return tokyonight.load()
      end,
    },
  },
}
