"let g:python3_host_prog = '/usr/bin/python3'
"let g:python3_host_prog = 'C:\Users\steve\AppData\Local\Microsoft\WindowsApps\python3.exe'
let g:powerline_loaded = 1
set fillchars=""
set laststatus=2
set mouse=a
set expandtab
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2
set cursorline
set number
set updatetime=250
set shortmess=I
set termguicolors
set foldmethod=syntax
set foldlevel=20
set exrc
set clipboard^=unnamed,unnamedplus
set fileformats=unix,dos
set fileformat=unix
 
filetype on
au BufNewFile,BufRead *.tikz set filetype=tex

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

nmap <ScrollWheelUp> <C-Y>
nmap <ScrollWheelDown> <C-E>
nmap <F2> :nohlsearch <CR>
nmap <F4> :UndotreeToggle<CR>

nmap <leader>cmb :CMake build<CR>
nmap <leader>cmc :CMake cancel<CR>
nmap <leader>cmsb :CMake select_build_type<CR>
nmap <leader>cmst :CMake select_target<CR>
nmap <leader>cmr :CMake build_and_run<CR>
nmap <leader>cmd :CMake build_and_debug<CR>

nnoremap <leader>gg :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>

nnoremap <leader>af :ALEFix<CR>

lua require('plugins')

" This disables deoplete when in telescope
autocmd FileType TelescopePrompt call
      \ deoplete#custom#buffer_option('auto_complete', v:false)

syntax enable
"colorscheme catppuccin
"colorscheme catppuccin-frappe
"colorscheme catppuccin-macchiato
"colorscheme catppuccin-mocha
"colorscheme catppuccin-latte

"colorscheme gruvbox
"colorscheme material
colorscheme sonokai
"colorscheme monokai
"colorscheme vim-monokai-tasty
"highlight Search guibg='Purple' guifg='NONE'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
"let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#std = {
    \'c': 'c11',
    \'cpp': 'c++20',
    \'objc': 'c11',
    \'objcpp': 'c++1z'
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>f{char} to move to {char}
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tt <cmd>Telescope <cr>
nnoremap <leader>tc <cmd>Telescope commands<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tx <cmd>Telescope file_browser<cr>
nnoremap <leader>tp <cmd>Telescope project<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>td <cmd>Telescope dap configurations<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable completion where available.
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 0
let g:vimtex_compiler_progname = 'nvr'

let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"

"" This is new style
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gf :Neoformat <CR>
vnoremap gf :Neoformat <CR>
let g:neoformat_tex_latexindent = {
  \ 'exe': 'latexindent',
  \ 'args': ['-l'],
  \ 'stdin': 1
  \ }
