PREFIX?=/usr

installmacos:
	cp -f macos/catfetch.sh $(PREFIX)/bin/catfetch
	chmod 755 $(PREFIX)/bin/catfetch
installposix:
	cp -f catfetchposix $(PREFIX)/bin/catfetch
	chmod 755 $(PREFIX)/bin/catfetch
install:
	cp -f catfetch $(PREFIX)/bin/catfetch
	chmod 755 $(PREFIX)/bin/catfetch
uninstall:
	rm -f $(PREFIX)/bin/catfetch

.PHONY: installmacos installposix install uninstall
