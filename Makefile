
srcdir = src

data = $(srcdir)/resume.yaml
semantics = $(srcdir)/resume.jade
layout = $(srcdir)/layout.jade
style = $(srcdir)/resume.sass
jademixins = $(srcdir)/mixins/*.jade
sassmixins = $(srcdir)/mixins/*.sass

renderer = bin/render-html.litcoffee
pdfrenderer = bin/render-pdf.litcoffee
watcher = ./node_modules/.bin/watch

.PHONY: all clean watch pdf

all: node_modules index.html

node_modules: package.json
	npm install
	@touch $@

index.html: $(semantics) $(data) $(jademixins) $(layout) main.css $(renderer)
	coffee $(renderer) -- $(semantics) $(data) $@

main.css: $(style) $(sassmixins)
	sass $< > $@

pdf: resume.pdf

resume.pdf: index.html $(pdfrenderer)
	coffee $(pdfrenderer) -- $< $@

clean:
	rm --recursive --force -- node_modules
	rm --force -- main.css
	rm --force -- index.html

watch: node_modules
	 $(watcher) '$(MAKE) all' src --wait=0
