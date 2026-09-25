 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#29141c',
    base01 = '#45212e',
    base02 = '#3e1e29',
    base03 = '#716267',
    base04 = '#b6afb1',
    base05 = '#f3f2f2',
    base06 = '#f3f2f2',
    base07 = '#f3f2f2',
    base08 = '#ee2f73',
    base09 = '#5b87d7',
    base0A = '#f05b42',
    base0B = '#f25a90',
    base0C = '#96b3e9',
    base0D = '#f689af',
    base0E = '#f69889',
    base0F = '#f9c2b8',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f3f2f2',          bg = '#29141c' })
  hi('TelescopeBorder',         { fg = '#716267',             bg = '#29141c' })
  hi('TelescopePromptNormal',   { fg = '#f3f2f2',          bg = '#29141c' })
  hi('TelescopePromptBorder',   { fg = '#716267',             bg = '#29141c' })
  hi('TelescopePromptPrefix',   { fg = '#f25a90',             bg = '#29141c' })
  hi('TelescopePromptCounter',  { fg = '#b6afb1',  bg = '#29141c' })
  hi('TelescopePromptTitle',    { fg = '#29141c',             bg = '#f25a90' })
  hi('TelescopePreviewTitle',   { fg = '#29141c',             bg = '#f05b42' })
  hi('TelescopeResultsTitle',   { fg = '#29141c',             bg = '#5b87d7' })
  hi('TelescopeSelection',      { fg = '#f3f2f2',          bg = '#3e1e29' })
  hi('TelescopeSelectionCaret', { fg = '#f25a90',             bg = '#3e1e29' })
  hi('TelescopeMatching',       { fg = '#f25a90',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f3f2f2',          bg = '#29141c' })
  hi('MiniPickBorder',         { fg = '#716267',             bg = '#29141c' })
  hi('MiniPickPrompt',   { fg = '#f3f2f2',          bg = '#29141c' })
  hi('MiniPickPromptPrefix',   { fg = '#f25a90',             bg = '#29141c' })
  hi('MiniPickBorderText',    { fg = '#29141c',             bg = '#f25a90' })
  hi('MiniPickMatchCurrent',      { fg = '#f3f2f2',          bg = '#3e1e29' })
  hi('MiniPickPromptCaret', { fg = '#f25a90',             bg = '#3e1e29' })
  hi('MiniPickMatchRanges',       { fg = '#f25a90',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
