PREFIX?=/usr

install:
	cp -f catfetch $(PREFIX)/bin/catfetch
	chmod 755 $(PREFIX)/bin/catfetch
uninstall:
	rm -f $(PREFIX)/bin/catfetch

.PHONY: install uninstall
