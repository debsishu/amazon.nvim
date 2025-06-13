return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local function utc_time()
      return os.date("%H:%M UTC")
    end
    opts.sections.lualine_z = {
      utc_time,
    }
    opts.options = {
      component_separators = { left = "|", right = "|" },
      section_separators = {},
    }
  end,
}
