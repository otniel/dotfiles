----------------------------- General settings -----------------------------
vim.opt.wrap = false
vim.opt.autowriteall = true

-- Tab chars settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.smartcase = true

-- Set input and idle timeouts
vim.o.timeout = 200 -- Input timeout length in milliseconds
vim.o.ttimeout = 100 -- Idle timeout length in milliseconds

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.errorbells = false

vim.opt.foldcolumn="2"
vim.api.nvim_command("highlight FoldColumn guibg=None") -- Set foldcolumn background to none in GUI mode
vim.api.nvim_command("highlight VertSplit guibg=None")

vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true

vim.opt.mouse = 'a'
vim.opt.termguicolors = true

vim.opt.spell = true

vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer

-- Enable splitting below and right
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true -- persistent undo

