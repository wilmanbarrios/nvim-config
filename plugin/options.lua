local opt = vim.opt
local g = vim.g

-- options
opt.autoindent            = true
opt.smartindent           = true
opt.expandtab             = true
opt.tabstop               = 4
opt.shiftwidth            = 4
opt.softtabstop           = 4

opt.cursorline            = false
opt.wrap                  = false

opt.hidden                = true

opt.ignorecase            = true

opt.inccommand            = 'split'

opt.colorcolumn           = '+1'

opt.completeopt           = {'menuone', 'noinsert', 'noselect'}

opt.mouse                 = 'a'

opt.backup                = false
opt.showmode              = true
opt.swapfile              = false
opt.writebackup           = false

opt.lazyredraw            = true

opt.number                = true
opt.relativenumber        = true
opt.signcolumn            = 'yes'

opt.pumblend              = 15
opt.pumheight             = 20

opt.scrolloff             = 10

opt.smartcase             = true

opt.splitbelow            = true
opt.splitright            = true

opt.termguicolors         = true

opt.updatetime            = 1000

opt.shortmess:append "c"

-- disable unused builtin plugins
g.loaded_netrw            = 1
g.loaded_netrwPlugin      = 1
g.loaded_tar              = 1
g.loaded_tarPlugin        = 1
g.loaded_zip              = 1
g.loaded_zipPlugin        = 1
g.loaded_gzip             = 1

-- disable unused builtin providers
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_python_provider  = 0
g.loaded_python3_provider = 0
g.loaded_node_provider    = 0
