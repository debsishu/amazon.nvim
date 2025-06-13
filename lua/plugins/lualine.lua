return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections.lualine_z = {
      function()
        local utc = os.time(os.date("!*t"))
        local ist = utc + 19800
        return "IST " .. os.date("%H:%M", ist)
      end,
      function()
        return "UTC " .. os.date("!%H:%M") -- '!' gets UTC time
      end,
    }
    opts.options = {
      component_separators = { left = "|", right = "|" },
      section_separators = {},
    }
  end,
}
