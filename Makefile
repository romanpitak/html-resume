
srcdir = src

data = $(srcdir)/resume.yaml
semantics = $(srcdir)/resume.jade
layout = $(srcdir)/layout.jade
style = $(srcdir)/resume.sass
mixins = $(srcdir)/mixins/*

renderer = bin/render-html.litcoffee
watcher = ./node_modules/.bin/watch

.PHONY: all clean watch

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

clean:
	rm --recursive --force -- node_modules
	rm --recursive --force -- bower_components
	rm --force -- main.css
	rm --force -- index.html

watch: node_modules
	 $(watcher) '$(MAKE) all' src --wait=1
