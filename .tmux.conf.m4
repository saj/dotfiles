divert(-1)

define(`os_name', patsubst(esyscmd(`uname -s'), `
'))

divert`'dnl
ifelse(os_name, `Darwin', `dnl
set  -g  default-command "reattach-to-user-namespace -l zsh"dnl
')
set  -g  default-terminal "screen-256color"

set  -gs escape-time 0
set  -g  history-limit 10000

setw -g  mode-mouse off

set  -g  status-bg black
set  -g  status-fg white
set  -g  status-left '#[fg=cyan]#S'
set  -g  status-right ''

setw -g  window-status-bg black
setw -g  window-status-current-bg black
setw -g  window-status-current-fg green
setw -g  window-status-fg red

# Old GNU screen habits die hard.
set -g prefix C-a
unbind C-b
bind a send-prefix

# So do old Vim habits.
set  -g status-keys vi
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Defaults for horizontal and vertical split.  Hard to remember.
unbind %
unbind '"'

# Use these instead.
bind - split-window -v -c '#{pane_current_path}'
bind \ split-window -h -c '#{pane_current_path}'

# It can be VERY frustrating to hit this key by accident.  (By default, 
# space will rearrange panes.)  Especially after spending an inordinate 
# amount of time twiddling panes into *just* the right proportions.
unbind Space

bind C-a last-window
unbind c
bind c new-window -c '#{pane_current_path}'

ifelse(os_name, `Darwin', `dnl
bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"dnl
')

bind r source-file ~/.tmux.conf

bind m command-prompt "split-window 'exec man %%'"
bind S command-prompt "new-window -n %1 'ssh %1'"
