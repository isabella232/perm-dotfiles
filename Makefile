.PHONY: all bin dotfiles setup test

CWD := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: bin dotfiles setup

bin:
	for file in $(CWD)/bin/*; do \
		sudo ln -sf $${file} /usr/local/bin/$$(basename $${file}); \
	done

dotfiles:
	for file in $(CWD)/dotfiles/*; do \
		ln -sfn $${file} $${HOME}/.$$(basename $${file}); \
	done

setup:
	$(CWD)/bin/setup-machine

test:
	$(CWD)/test.sh
