return {
  "vimichael/floatingtodo.nvim",
  config = function()
    require("floatingtodo").setup({
      target_file = "~/Desktop/Personal/Notes/todo.md",
      border = "rounded", -- single, rounded, etc.
      width = 1, -- width of window in % of screen size
      height = 0.8, -- height of window in % of screen size
      position = "center", -- topleft, topright, bottomleft, bottomright
    })
    vim.keymap.set("n", "<leader>td", ":Td<CR>", { silent = true, desc = "Open a todo list buffer" })
  end,
}
