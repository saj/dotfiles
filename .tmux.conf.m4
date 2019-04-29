# This configuration must remain backwards compatible with tmux 1.6.
# (I still have EL6 machines with tmux installed from EPEL.)

divert(-1)

dnl  This divert(-1)...divert[]dnl m4 pattern is used to suppress spurious, but
dnl  syntactically harmless, blank lines in our output.

changequote(`[', `]')

define([newline], [
])

define([shellchomp], [patsubst(esyscmd([$1]), newline)])

define([os_name], shellchomp([uname -s]))

define([tmux_major_version], shellchomp([tmux -V | sed 's/^tmux //' | awk -F . '{print $1}']))
define([tmux_minor_version], shellchomp([tmux -V | sed 's/^tmux //' | awk -F . '{print $2}']))

dnl  neww -c ... (superseded default-path in tmux 1.9)
define([feat_new_window_accepts_c_flag],
  [ifelse(tmux_major_version, [1],
    [ifelse(shellchomp([test "]tmux_minor_version[" -lt 9; echo $?]), [0],
      [0],
      [1])],
    [1])])

divert[]dnl
ifelse(os_name, [Darwin], [dnl
set  -g  default-command "reattach-to-user-namespace -l zsh"
])dnl
set  -g  default-terminal "screen-256color"

set  -gs escape-time 0
set  -g  history-limit 10000

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
ifelse(feat_new_window_accepts_c_flag, [1], [dnl
bind - split-window -v -c '#{pane_current_path}'
bind \ split-window -h -c '#{pane_current_path}'
], [dnl
bind - split-window -v
bind \ split-window -h
])dnl

# It can be VERY frustrating to hit this key by accident.  (By default, 
# space will rearrange panes.)  Especially after spending an inordinate 
# amount of time twiddling panes into *just* the right proportions.
unbind Space

bind C-a last-window
unbind c
ifelse(feat_new_window_accepts_c_flag, [1], [dnl
bind c new-window -c '#{pane_current_path}'
], [dnl
bind c new-window
])dnl

ifelse(os_name, [Darwin], [dnl
bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"

])dnl
bind r source-file ~/.tmux.conf

bind m command-prompt "split-window 'exec man %%'"
bind S command-prompt "new-window -n %1 'ssh %1'"
