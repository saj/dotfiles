all: .gvimrc .tmux.conf ssh

.PHONY: all

.gvimrc: .gvimrc.m4
	m4 .gvimrc.m4 >.gvimrc

.tmux.conf: .tmux.conf.m4
	m4 .tmux.conf.m4 >.tmux.conf

ssh:
	$(MAKE) -C .ssh

.PHONY: ssh
