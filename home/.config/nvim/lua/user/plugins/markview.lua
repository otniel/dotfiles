require('markview').setup({
  preview = {
    icon_provider = 'devicons',
  },
})

vim.keymap.set('n', '<Leader>mp', ':Markview toggle<CR>')
