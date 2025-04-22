-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep the cursor in the middle while moving half page at a time
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move chuck of lines in visual mode using J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste and delete the current highlighted word to void register
vim.keymap.set("x", "<leader>p", '"_dP')

-- Leader y to yank into system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Leader d to delete in void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>bod", "<CMD>%bd|e#|bd#|e<CR>", { desc = "Delete All Other Buffers except current" })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- That mythical method to run a single fucking unit test in both HappierTrails and BrazilGradle
-- tbh bunch of spaghetti code but who cares haha
function RunSingleUnitTest(test_type)
  -- Check if the current file is a Java file
  local filetype = vim.bo.filetype
  if filetype ~= "java" then
    vim.api.nvim_err_writeln("Error: Brazil single unit test only runs on java files")
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local package_name = ""
  local class_name = ""
  local method_name = ""

  -- Find package name
  for _, line in ipairs(lines) do
    local package_match = line:match("^%s*package%s+([%w%.]+);")
    if package_match then
      package_name = package_match
      break
    end
  end

  -- Find class name
  for _, line in ipairs(lines) do
    local class_match = line:match("^%s*public%s+class%s+([%w_]+)")
    if class_match then
      class_name = class_match
      break
    end
  end

  -- Check if class name contains "test" case insensitive
  if not class_name:lower():find("test") then
    vim.api.nvim_err_writeln("Error: This is not a test file")
    return
  end

  -- Find method name based on cursor position and ensure it is public
  -- TODO: Can be better to check @Test annotation above it's signature
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cursor_line = lines[cursor_pos[1]]
  local method_match = cursor_line:match("^%s*public%s+[%w_]+%s+([%w_]+)%s*%(")

  -- Check if method name was found and is public
  if not method_match then
    vim.api.nvim_err_writeln("Error: This is not a public method to test")
    return
  end
  method_name = method_match

  local tmux_command = ""
  local brazil_single_unit_test = ""

  if test_type == "HappierTrails" then
    brazil_single_unit_test = string.format(
      "brazil-build single-unit-test -DtestClass=%s.%s -DtestMethods=%s",
      package_name,
      class_name,
      method_name
    )
    tmux_command = string.format("tmux new-window 'zsh -c \"%s; exec zsh\"'", brazil_single_unit_test)
  end
  if test_type == "BrazilGradle" then
    brazil_single_unit_test = string.format("brazil-build test --tests %s.%s", class_name, method_name)
    tmux_command = string.format("tmux new-window 'zsh -c \"%s; exec zsh\"'", brazil_single_unit_test)
  end

  -- vim.fn.system(tmux_command)
  vim.api.nvim_call_function("setreg", { "+y", brazil_single_unit_test })
  vim.notify("Copied brazil command in clipboard", vim.log.levels.INFO)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>cuth",
  ":lua RunSingleUnitTest('HappierTrails')<CR>",
  { noremap = true, silent = true, desc = "Run HappierTrails single unit test" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cutg",
  ":lua RunSingleUnitTest('BrazilGradle')<CR>",
  { noremap = true, silent = true, desc = "Run BrazilGradle single unit test" }
)
