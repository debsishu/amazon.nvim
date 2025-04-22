return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
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
        "packageInfo",
        "venv",
        "packageInfo.bak"
      },
    },
  },
}
