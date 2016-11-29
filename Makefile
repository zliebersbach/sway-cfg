DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
LINK=$(HOME)/.sway

.PHONY: clean install uninstall default fetch-updates update

clean:
	git reset --hard

install:
	ln -s $(DIR) $(LINK)

uninstall: $(LINK)
	rm $(LINK)

fetch-updates:
	git pull --rebase --prune
	git submodule update --init --recursive

update: clean fetch-updates

default: update install
