return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },
  opts = {
    scratch = {},
    scroll = { enabled = false },
    dashboard = {
      preset = {
        header = [[
█▀▄ ██▀ █▄▄ ▄▀▀ █ ▄▀▀ █▄█ █ █
█▄▀ █▄▄ █▄█ ▄██ █ ▄██ █ █ ▀▄█
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    picker = {
      exclude = {
        ".git/",
        "node_modules/",
        "target/",
        "__pycache__/",
        ".pytest_cache/",
        "build/",
        ".bemol/",
        ".brazil/",
        "release-info/",
        "env/",
        ".settings/",
        "logs/",
        "versionSets/",
        ".ignore",
        "packageInfo",
        "packageInfo.bak",
        ".gradle",
      },
    }
  },
}
