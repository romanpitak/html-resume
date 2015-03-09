
srcdir = src

.PHONY: all

all: node_modules index.html

node_modules: package.json
	npm install
	@touch node_modules

index.html: $(srcdir)/index.jade $(srcdir)/resume.yaml
	coffee bin/render-html.litcoffee -- $^ $@
