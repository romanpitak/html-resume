
srcdir = src

data = $(srcdir)/resume.yaml
semantics = $(srcdir)/resume.jade
layout = $(srcdir)/layout.jade
style = $(srcdir)/resume.sass
mixins = $(srcdir)/mixins/*
renderer = bin/render-html.litcoffee

.PHONY: all

all: node_modules bower_components index.html

node_modules: package.json
	npm install
	@touch $@

bower_components: bower.json
	bower install
	@touch $@

index.html: $(semantics) $(data) $(mixins) $(layout) main.css $(renderer)
	coffee $(renderer) -- $(semantics) $(data) $@

main.css: $(style)
	sass $< > $@
