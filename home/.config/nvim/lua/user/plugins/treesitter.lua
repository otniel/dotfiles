require('nvim-treesitter').install('all')

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if ok then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  },
})

local function select_textobject(query)
  return function()
    require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
  end
end

vim.keymap.set({ 'x', 'o' }, 'if', select_textobject('@function.inner'))
vim.keymap.set({ 'x', 'o' }, 'af', select_textobject('@function.outer'))
vim.keymap.set({ 'x', 'o' }, 'ia', select_textobject('@parameter.inner'))
vim.keymap.set({ 'x', 'o' }, 'aa', select_textobject('@parameter.outer'))

require('ts_context_commentstring').setup({})
