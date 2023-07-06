require 'plugins'
local set = vim.opt
set.conceallevel  = 1
set.concealcursor = 'n'
set.fillchars     = ''
set.laststatus    = 2
set.mouse         = 'a'
set.expandtab     = true
set.shiftwidth    = 2
set.tabstop       = 2
set.expandtab     = true
set.softtabstop   = 2
set.cursorline    = true
set.number        = true
set.updatetime    = 250
set.shortmess     = 'I'
set.termguicolors = true
set.foldmethod    = 'syntax'
set.foldlevel     = 20
set.exrc          = true


vim.cmd[[
set textwidth=100
set formatoptions-=t
set clipboard^=unnamed,unnamedplus

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>


nmap <ScrollWheelUp> <C-Y>
nmap <ScrollWheelDown> <C-E>
nmap <F2> :nohlsearch <CR>
nmap <F4> :TagbarToggle <CR>
autocmd BufRead * :lua require('config.dap').load_breakpoints()
]]

