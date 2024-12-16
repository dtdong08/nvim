-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {
  ui = {
    theme = "catppuccin",
    transparency = false,
    cmp = {
      icons = true,
      lspkind_text = true,
      style = "default"
    },
    statusline = {
      separator_style = "arrow"
    },
    nvdash = {
      load_on_startup = true,
      buttons = {
        { "  Find File", "<leader> + ff", "Telescope find_files" },
        { "󰈚  Recent Files", "<leader> + fo", "Telescope oldfiles" },
        { "󰈭  Find Word", "<leader> + fw", "Telescope live_grep" },
        { "  Bookmarks", "<leader> + ma", "Telescope marks" },
        { "  Themes", "<leader> + th", "Telescope themes" },
        { "  Mappings", "<leader> + ch", "NvCheatsheet" }
      }
    }
  },
  cheatsheet = {
    excluded_groups = {}
  }
}

return M
