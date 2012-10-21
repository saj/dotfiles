.tmux.conf: .tmux.conf.m4
	m4 .tmux.conf.m4 >.tmux.conf

all: .tmux.conf
.PHONY: all
