DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
LINK=$(HOME)/.sway
XRES_LINK=$(HOME)/.Xresources

.PHONY: clean install uninstall default fetch-updates update

clean:
	git reset --hard

install:
	ln -s $(DIR) $(LINK)
	ln -s $(DIR)/Xresources $(XRES_LINK)

uninstall:
	unlink $(LINK)
	unlink $(XRES_LINK)

fetch-updates:
	git pull --rebase --prune

update: clean fetch-updates

default: update install
