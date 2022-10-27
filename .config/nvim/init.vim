"let g:python3_host_prog = '/usr/bin/python3'
"let g:python3_host_prog = 'C:\Users\steve\AppData\Local\Microsoft\WindowsApps\python3.exe'
let g:powerline_loaded = 1
set fillchars=""
set laststatus=2
set mouse=a
set expandtab
set shiftwidth=2
set softtabstop=2
set cursorline
set number
set updatetime=250
set shortmess=I
set termguicolors
set foldmethod=syntax
set foldlevel=20

"set shell=/bin/bash
"set exrc
"set secure
 
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


nnoremap gf :Neoformat <CR>
vnoremap gf :Neoformat <CR>
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

nnoremap <F5> :Git<CR>
nnoremap <F6> :Git commit<CR>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

nmap <F9> :cnext <CR>
nmap <F10> :cprev <CR>
map <F11> :tabp<cr>
map <F12> :tabn<cr>


lua require('plugins')
lua require('treesitter')
lua require('_telescope')
lua << EOF
require('Comment').setup({padding = false})
EOF
lua << EOF
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ',
                          vim.fn.getcwd() .. '/',
                          'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
EOF

" This disables deoplete when in telescope
autocmd FileType TelescopePrompt call
      \ deoplete#custom#buffer_option('auto_complete', v:false)

colorscheme monokai
syntax enable
highlight Search guibg='Purple' guifg='NONE'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

"
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
nmap <F3> :Telescope find_files <CR>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tt <cmd>Telescope <cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tx <cmd>Telescope file_browser<cr>
nnoremap <leader>tp <cmd>Telescope project<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 0

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable completion where available.
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 0
let g:ale_c_build_dirs = ['build']

let g:ale_linters = { 'cpp': ['clangtidy'] }
let g:ale_cpp_build_dirs = ['build', 'build/linux-debug', 'build/linux-release']
"
let g:ale_cpp_clang_options = '-std=c++20 -Wall -Wextra -Wpedantic -I/home/steve/libs/tatooine/include'
let g:ale_fixers = {'cpp': ['clangtidy', 'trim_whitespace']}

let g:ale_cpp_clangtidy_checks = [
\ '-*',
\ 'cppcoreguidelines*',
\ '-cppcoreguidelines-pro-type-reinterpret-cast',
\ '-cppcoreguidelines-pro-bounds-pointer-arithmetic',
\ '-cppcoreguidelines-avoid-magic-numbers', 
\ '-cppcoreguidelines-avoid-c-arrays',
\ 
\ 'cert*',
\ '-cert-err34-c',
\ 
\ 'hicpp*',
\ '-hicpp-avoid-c-arrays',
\ 
\ 'modernize*',
\ '-modernize-avoid-c-arrays',
\ 
\ 'performance*',
\ 
\ 'readability*',
\ '-readability-isolate-declaration',
\ '-readability-static-accessed-through-instance',
\ '-readability-magic-numbers',
\ '-readability-identifier-length'
\]
let g:ale_cpp_clangtidy_options = '-std=c++20'
let g:ale_cpp_cppcheck_options = ['--enable=style', '--enable=performance', '--enable=portability']

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

