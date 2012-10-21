divert(-1)

define(`os_name', patsubst(esyscmd(`uname -s'), `
'))

divert`'dnl
ifelse(os_name, `Darwin', `dnl
set  -g  default-command "reattach-to-user-namespace -l zsh"dnl
')
set  -g  default-terminal "screen-256color"
set  -gs escape-time 0
set  -g  history-limit 1000
set  -g  prefix C-a
set  -g  status-bg black
set  -g  status-fg white
set  -g  status-keys vi
set  -g  status-keys vi
set  -g  status-left '#[fg=cyan]#S'
set  -g  status-right '#[fg=cyan]%H:%M %b %e'
setw -g  mode-keys vi
setw -g  mode-mouse off
setw -g  window-status-bg black
setw -g  window-status-current-bg black
setw -g  window-status-current-fg green
setw -g  window-status-fg red

# Old GNU screen habits die hard.
unbind C-b
bind a send-prefix

# Defaults for horizontal and vertical split.  Hard to remember.
unbind %
unbind '"'

# Use these instead.
bind - split-window -v
bind \ split-window -h

bind C-a last-window
ifelse(os_name, `Darwin', `dnl
bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"dnl
')
bind m command-prompt "split-window 'exec man %%'"
bind r source-file ~/.tmux.conf
bind S command-prompt "new-window -n %1 'ssh %1'"
