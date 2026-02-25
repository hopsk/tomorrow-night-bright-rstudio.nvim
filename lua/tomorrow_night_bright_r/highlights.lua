local M = {}

local function set(group, spec)
vim.api.nvim_set_hl(0, group, spec)
end

local function link(from, to)
set(from, { link = to })
end

function M.apply(c)
-- ========== Core UI ==========
set("Normal",       { fg = c.fg, bg = c.bg })
set("NormalNC",     { fg = c.fg, bg = c.bg })
set("EndOfBuffer",  { fg = c.bg })
set("VertSplit",    { fg = c.sel })
set("WinSeparator", { fg = c.sel })

set("CursorLine",   { bg = c.sel })
set("Visual",       { bg = c.sel })

set("LineNr",       { fg = c.gutter })
set("CursorLineNr", { fg = c.fg })
set("SignColumn",   { fg = c.gutter, bg = c.bg })

set("StatusLine",   { fg = c.fg, bg = c.sel })
set("StatusLineNC", { fg = c.comment, bg = c.sel })

set("Pmenu",        { fg = c.fg, bg = c.sel })
set("PmenuSel",     { fg = c.bg, bg = c.blue })
set("PmenuSbar",    { bg = c.sel })
set("PmenuThumb",   { bg = c.gutter })

set("FloatBorder",  { fg = c.sel, bg = c.bg })
set("NormalFloat",  { fg = c.fg, bg = c.bg })

set("Search",       { fg = c.bg, bg = c.yellow })
set("IncSearch",    { fg = c.bg, bg = c.orange })
set("MatchParen",   { bg = c.sel })

-- ========== Classic syntax ==========
set("Comment",    { fg = c.comment, italic = true })
set("String",     { fg = c.green })
set("Character",  { fg = c.green })

set("Number",     { fg = c.orange })
set("Float",      { fg = c.orange })
set("Boolean",    { fg = c.orange })
set("Constant",   { fg = c.orange })

set("Type",       { fg = c.yellow })
set("StorageClass",{ fg = c.yellow })

set("Keyword",    { fg = c.purple })
set("Statement",  { fg = c.purple })
set("Conditional",{ fg = c.purple })
set("Repeat",     { fg = c.purple })

set("Operator",   { fg = c.aqua })
set("Delimiter",  { fg = c.fg })

set("Identifier", { fg = c.fg })
-- R Classic: functions are NOT emphasized as blue; keep them foreground
set("Function",   { fg = c.fg })

set("PreProc",    { fg = c.purple })
set("Include",    { fg = c.purple })
set("Define",     { fg = c.purple })

set("Special",    { fg = c.aqua })
set("SpecialChar",{ fg = c.aqua })

set("Error",      { fg = c.fg, bg = c.red })

-- ========== Diagnostics (LSP) ==========
set("DiagnosticError", { fg = c.red })
set("DiagnosticWarn",  { fg = c.aqua })
set("DiagnosticInfo",  { fg = c.blue })
set("DiagnosticHint",  { fg = c.comment })

set("DiagnosticUnderlineError", { underline = true, sp = c.red })
set("DiagnosticUnderlineWarn",  { underline = true, sp = c.aqua })
set("DiagnosticUnderlineInfo",  { underline = true, sp = c.blue })
set("DiagnosticUnderlineHint",  { underline = true, sp = c.comment })

-- ========== Treesitter: general ==========
link("@comment", "Comment")

link("@string", "String")
link("@string.regex", "String")
link("@character", "Character")

link("@number", "Number")
link("@float", "Float")
link("@boolean", "Boolean")

link("@type", "Type")
link("@type.builtin", "Type")

link("@keyword", "Keyword")
link("@keyword.function", "Keyword")
link("@keyword.operator", "Operator")
link("@keyword.return", "Keyword")

link("@operator", "Operator")
link("@punctuation", "Delimiter")
link("@punctuation.delimiter", "Delimiter")
link("@punctuation.bracket", "Delimiter")
link("@punctuation.special", "Delimiter")

-- Variables / identifiers
link("@variable", "Identifier")
link("@variable.builtin", "Identifier")
link("@constant", "Constant")
link("@constant.builtin", "Constant")

-- Functions: keep foreground (R Classic)
link("@function", "Function")
link("@function.call", "Function")
link("@function.builtin", "Function")
link("@method", "Function")
link("@method.call", "Function")

-- Parameters often look better slightly dimmer, but keep simple v1:
link("@parameter", "Identifier")

-- Properties/fields: keep as Identifier
link("@property", "Identifier")
link("@field", "Identifier")

-- ========== R-specific Treesitter (pragmatic) ==========
-- In R, many queries tag operators/assignment; ensure assignment stands out
link("@operator.r", "Operator")
link("@keyword.r", "Keyword")
link("@function.r", "Function")
link("@variable.r", "Identifier")

-- ========== Common plugin integrations ==========
-- Telescope
set("TelescopeBorder",       { fg = c.sel, bg = c.bg })
set("TelescopeNormal",       { fg = c.fg, bg = c.bg })
set("TelescopeSelection",    { bg = c.sel })
set("TelescopeSelectionCaret",{ fg = c.orange })
set("TelescopePromptPrefix", { fg = c.orange })
set("TelescopeMatching",     { fg = c.yellow })

-- nvim-cmp
link("CmpItemAbbr", "Normal")
set("CmpItemAbbrMatch",      { fg = c.yellow })
set("CmpItemAbbrMatchFuzzy", { fg = c.yellow })
set("CmpItemKind",           { fg = c.purple })
set("CmpItemMenu",           { fg = c.comment })

-- Git-style signs (if you use gitsigns later)
set("GitSignsAdd",    { fg = c.green })
set("GitSignsChange", { fg = c.aqua })
set("GitSignsDelete", { fg = c.red })
end

return M
