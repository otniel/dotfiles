require('night-owl').setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"

    -- Spelling
    hl.SpellBad = {
      undercurl = true,
      sp = '#7F3A43',
    }

    -- Telescope
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = c.bg,
      fg = c.fg_dark,
      -- bg = prompt,
      -- fg = '#ffffff',
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }

    -- Lualine
    hl.StatusLineNonText = {
      bg = c.bg_dark,
      fg = c.fg_gutter,
    }

    -- Indent
    hl.IndentBlanklineChar = {
      fg = c.bg_highlight,
    }

    -- Floaterm
    hl.Floaterm = {
      bg = prompt,
    }
    hl.FloatermBorder = {
      bg = prompt,
      fg = prompt,
    }

    -- Copilot
    hl.CopilotSuggestion = {
      fg = c.comment,
    }

    -- NvimTree
    hl.NvimTreeIndentMarker = {
      fg = c.bg_highlight,
    }
    hl.NvimTreeOpenedFile = {
      fg = c.fg,
      bold = true
    }
    hl.StatusLineNonText = {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    }
  end,
})

vim.cmd.colorscheme("night-owl")

-- vim.api.nvim_set_hl(0, "StatusLineNonText", {
--   fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--   bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
-- })
