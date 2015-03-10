
srcdir = src

data = $(srcdir)/resume.yaml
semantics = $(srcdir)/index.jade
mixins = $(srcdir)/mixins/*
renderer = bin/render-html.litcoffee

.PHONY: all

all: node_modules index.html

node_modules: package.json
	npm install
	@touch node_modules

index.html: $(semantics) $(data) $(mixins) $(renderer)
	coffee $(renderer) -- $(semantics) $(data) $@
