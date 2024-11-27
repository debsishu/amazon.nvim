return {
  {
    url = "ssh://git.amazon.com/pkg/NinjaHooks.git",
    branch = "mainline",
    lazy = false,
    config = function(self)
      local brazil_config = self.dir .. "/configuration/vim/amazon/brazil-config"
      vim.opt.runtimepath:append(brazil_config)
      vim.filetype.add({
        filename = {
          ["Config"] = function()
            vim.b.brazil_package_Config = 1
            return "brazil-config"
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      if not configs.barium then
        configs.barium = {
          default_config = {
            cmd = { "barium" },
            filetypes = { "brazil-config" },
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname)
            end,
            settings = {},
          },
        }
      end
      lspconfig.barium.setup({})

      return opts
    end,
  },
}
