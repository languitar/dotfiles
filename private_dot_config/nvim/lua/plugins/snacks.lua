return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = "fish",
      },
      picker = {
        formatters = {
          file = {
            truncate = 120,
          },
        },
        -- Disable escape in picker to prevent it from accidentally closing
        -- https://github.com/folke/snacks.nvim/discussions/1312
        sources = {
          notifications = {
            transform = function(item)
              if item.preview then
                item.preview.ft = nil
              end
              return item
            end,
          },
          explorer = {
            win = {
              input = {
                keys = {
                  ["<esc>"] = { "", mode = "n" },
                },
              },
              list = {
                keys = {
                  ["<esc>"] = { "", mode = "n" },
                },
              },
            },
          },
        },
      },
    },
  },
}
