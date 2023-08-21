local M = {}
function M.setup() 
  vim.cmd [[
  let g:airline_powerline_fonts = 1
  "let g:airline_theme='gruvbox'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extnsions#tabline#formatter = 'unique_tail'
  ]]
end
return M
