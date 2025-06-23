return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function()
      local options = {
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          fzf = true,
          mason = true,
          snacks = {
            enabled = true,
            indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          },
        },
      }
      -- Check if Neovide is running and adjust settings
      if vim.g.neovide then
        options.transparent_background = false
      end

      return options
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
