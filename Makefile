PREFIX?=./local

install:
	install -Dm755 catfetch.sh $(PREFIX)/bin/catfetch.sh
  
