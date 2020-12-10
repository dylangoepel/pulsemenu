all: ~/.local/bin/pulsemenu

~/.local/bin/pulsemenu: pulsemenu.sh
	cp $< $@
	chmod +x $@
