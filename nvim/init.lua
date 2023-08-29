vim.cmd [[highlight Headline1 guibg=#3A5F75]]
vim.cmd [[highlight Headline2 guibg=#2F3E5E]]
vim.cmd [[highlight Headline3 guibg=#663F28]]
vim.cmd [[highlight Headline4 guibg=#334222]]
require 'setup_lazy'
local lazy = require 'lazy'
lazy.setup('plugins')
require 'general_settings'
require 'general_keymaps'
require 'auto_cmd'
require 'search_selection'
