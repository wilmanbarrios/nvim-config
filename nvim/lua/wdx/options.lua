local opt = vim.opt

-- options
opt.termguicolors = true

opt.spell = true
opt.spelloptions = { "camel" } --- if a word is CamelCased, assume "Cased" is a separate word

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.textwidth = 80

opt.ignorecase = true -- ignore command cases e.g. packerup -> PackerUpdate when hitting tab
opt.smartcase = true

opt.cursorline = true
opt.wrap = false

opt.hidden = true

opt.inccommand = "split"

opt.colorcolumn = "+1"

opt.completeopt = { "menuone", "noinsert", "noselect" }

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
