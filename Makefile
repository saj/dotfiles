.gvimrc: .gvimrc.m4
	m4 .gvimrc.m4 >.gvimrc

.tmux.conf: .tmux.conf.m4
	m4 .tmux.conf.m4 >.tmux.conf

all: .gvimrc .tmux.conf

.PHONY: all
