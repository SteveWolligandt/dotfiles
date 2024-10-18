return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  keys = {
    { '<leader>f', "<cmd>HopChar1<cr>", desc = 'Hop to character' },
    { 'f', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end},
    { 'F', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })end},
    { 't', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end },
    { 'T', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end },
  },
}
