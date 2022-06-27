let g:python3_host_prog = "/usr/bin/python3"
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



nmap <ScrollWheelUp> <C-Y>
nmap <ScrollWheelDown> <C-E>
"nnoremap <silent> `` :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>
nmap <F2> :nohlsearch <CR>
nmap <F3> :Files<CR>
nmap <F4> :UndotreeToggle<CR>

nmap <leader>cmb :CMake build<CR>
nmap <leader>cmc :CMake cancel<CR>
nmap <leader>cmr :CMake build_and_run<CR>

nmap <leader>l<F3> :Files ~/libs/<CR>
nmap <leader>p<F3> :Files ~/projects/<CR>
nmap <leader>h<F3> :Files ~/<CR>

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
lua << EOF
require('Comment').setup({padding = false})
EOF

colorscheme monokai
syntax enable
highlight Search guibg='Purple' guifg='NONE'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-gdb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" We're going to define single-letter keymaps, so don't try to define them
" in the terminal window.  The debugger CLI should continue accepting text commands.
"function! NvimGdbNoTKeymaps()
"  tnoremap <silent> <buffer> <esc> <c-\><c-n>
"endfunction
"
"let g:nvimgdb_config_override = {
"  \ 'key_next': 'n',
"  \ 'key_step': 's',
"  \ 'key_finish': 'f',
"  \ 'key_continue': 'c',
"  \ 'key_until': 'u',
"  \ 'key_breakpoint': 'b',
"  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
"  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:minimap_width = 20
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1
"let g:minimap_git_colors = 1
"let g:minimap_highlight_search = 1
"let g:minimap_highlight_range = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++20', 'objc': 'c11', 'objcpp': 'c++1z'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clangformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map to <leader>cf in C++ code
"autocmd FileType h,c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType h,c,cpp,cc,hh,objc,cu,cuh vnoremap <silent><leader>cf :ClangFormat<CR>
autocmd FileType h,c,cpp,cc,hh,objc,cu,cuh noremap <silent><leader>Cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType h,c,cpp,objc map <buffer><leader>x <Plug>(operator-clang-format)
let g:clang_format#auto_format = 0
let g:clang_format#detect_style_file = 1

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
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

""""""""" Global options
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""" Command-local options
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


""""""""" Advanced customization
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


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

"" Enable completion where available.
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 0
let g:ale_c_build_dirs = ['build']

let g:ale_linters = { 'cpp': ['clangtidy'] }
let g:ale_cpp_build_dirs = ['build']
"
let g:ale_cpp_clang_options = '-std=c++20 -Wall -Wextra -Wpedantic -I/home/steve/libs/tatooine/include'
let g:ale_fixers = {'cpp': ['clangtidy', 'trim_whitespace']}

let g:ale_cpp_clangtidy_checks = ['-*', 'cppcoreguidelines*', 'cert*', 'hicpp*', 'modernize*', 'performance*', 'readability*', '-cppcoreguidelines-pro-type-reinterpret-cast', '-cppcoreguidelines-pro-bounds-pointer-arithmetic', '-cert-err34-c', '-readability-isolate-declaration', '-readability-static-accessed-through-instance', '-cppcoreguidelines-avoid-magic-numbers', '-readability-magic-numbers','-cppcoreguidelines-avoid-c-arrays','-hicpp-avoid-c-arrays','-modernize-avoid-c-arrays']
let g:ale_cpp_clangtidy_options = '-std=c++20 -Wall, -Wextra -Wpedantic -I/home/steve/libs/tatooine/include'

let g:ale_cpp_cppcheck_options = ['--enable=style', '--enable=performance', '--enable=portability']

"let g:ale_cpp_cpplint_options = ''
"
"let g:ale_cpp_flawfinder_minlevel = 1
"let g:ale_cpp_flawfinder_options = ''
"
"let g:ale_cpp_gcc_executable = 'gcc'
"let g:ale_cpp_gcc_options = '-std=c++20 -Wall -Wextra -Wpedantic'
"
"let g:ale_enabled = 0
"let g:ale_fix_on_save = 0
"let g:ale_fixers = {}
"
"let g:ale_cursor_detail = 0
"let g:lightline = {}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clangformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map to <Leader>cf in C++ code
" autocmd FileType h,c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType h,hpp,c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType h,c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
let g:clang_format#auto_format = 0
let g:clang_format#detect_style_file = 1


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

