
srcdir = src

data = $(srcdir)/resume.yaml
semantics = $(srcdir)/resume.jade
layout = $(srcdir)/layout.jade
mixins = $(srcdir)/mixins/*
renderer = bin/render-html.litcoffee

.PHONY: all

all: node_modules index.html

node_modules: package.json
	npm install
	@touch node_modules

index.html: $(semantics) $(data) $(mixins) $(layout) $(renderer)
	coffee $(renderer) -- $(semantics) $(data) $@
