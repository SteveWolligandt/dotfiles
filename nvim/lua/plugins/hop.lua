return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  keys = {
    { '<leader>f', "<cmd>HopChar1<cr>", desc = 'Hop to character' },
    { 'f', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"},
    { 'F', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"},
    { 't', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>" },
    { 'T', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>" },
  },
}
