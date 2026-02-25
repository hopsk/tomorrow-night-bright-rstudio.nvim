local M = {}

function M.load()
  vim.o.background = "dark"

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "tomorrow-night-bright-r"

  local palette = require("tomorrow_night_bright_r.palette")
  local highlights = require("tomorrow_night_bright_r.highlights")
  highlights.apply(palette)
end

return M
