return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
    { "<leader>bd",  function() Snacks.bufDelete() end, desc = "Delete/Close Current Buffer" },
    { "<leader>bod",  function() Snacks.bufdelete.other() end, desc = "Delete/Close All Other Buffers Except the Current" },
  },
  opts = {
    scratch = { enabled = true },
    bufdelete = { enabled = true },
    scroll = { enabled = false },
    picker = { enabled = false },
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
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
