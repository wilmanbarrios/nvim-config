local opt = vim.opt
local g = vim.g

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

-- options
opt.spell                 = true
opt.spelloptions:append('camel') --- if a word is CamelCased, assume "Cased" is a separate word

opt.autoindent            = true
opt.smartindent           = true
opt.expandtab             = true
opt.tabstop               = 2
opt.shiftwidth            = 2
opt.softtabstop           = 2

opt.ignorecase            = true -- ignore command cases e.g. packerup -> PackerUpdate when hitting tab
opt.smartcase             = true

opt.cursorline            = true
opt.wrap                  = false

opt.hidden                = true

opt.inccommand            = 'split'

opt.colorcolumn           = '+1'

opt.completeopt           = {'menuone', 'noinsert', 'noselect'}

opt.mouse                 = 'a'

opt.backup                = false
opt.swapfile              = false

opt.number                = true
opt.relativenumber        = true
opt.signcolumn            = 'yes'

opt.pumheight             = 20

opt.scrolloff             = 10

opt.splitbelow            = true
opt.splitright            = true

opt.termguicolors         = true

opt.updatetime            = 50

-- opt.shortmess:append("c") --- will test what is this affecting
