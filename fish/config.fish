oh-my-posh init fish --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tokyonight_storm.omp.json' | source

set -xg PATH /usr/lib/ccache/bin $PATH
set -xg PATH $PATH /opt/cuda/bin
set -g theme_powerline_fonts yes 

alias cninja 'cmake -GNinja'
alias ccninja 'ccmake -GNinja'
alias vim 'nvim'

alias lg 'lazygit'
alias ls 'lsd'
alias cat 'bat'
alias du 'dust'
alias df 'duf'

source /usr/share/autojump/autojump.fish

set -g theme_display_git yes
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_title_use_abbreviated_path yes

set -x DISPLAY 172.26.128.1:0
