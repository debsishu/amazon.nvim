return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window Left" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window Right" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window up" },
    },
  },
}
