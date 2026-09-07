require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  -- Upstream registry points at a moved GitHub account; the tarball URL
  -- 404s, so this parser fails to install on every startup.
  ignore_install = { 'ipkg' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
      },
    }
  }
})
require('ts_context_commentstring').setup({

})
