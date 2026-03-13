local opt = vim.opt
local g = vim.g

-- disable unused providers
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0

opt.spell = true
--- if a word is CamelCased, assume "Cased" is a separate word
opt.spelloptions = { "camel" }

opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.textwidth = 80

-- ignore command cases when hitting tab
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.wrap = false

opt.hidden = true

opt.inccommand = "split"

opt.colorcolumn = "80,120"

opt.mouse = "a"

opt.backup = false
opt.swapfile = false

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.pumheight = 20

opt.scrolloff = 10

opt.splitbelow = true
opt.splitright = true

opt.updatetime = 550

-- opt.shortmess:append("c") --- will test what is this affecting
