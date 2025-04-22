return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function()
      local options = {
        flavour = "mocha",
        transparent_background = true,
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
