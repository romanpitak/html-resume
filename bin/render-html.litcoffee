# Builder

### Load modules

    {readFileSync, writeFileSync} = require 'fs'
    {renderFile} = require 'jade'
    {safeLoad} = require 'js-yaml'
    marked = require 'marked'

### Add custom `nbsp` support

Extend the default `renderer.paragraph` method
by first replacing all `~` characters
(which I don't use in paragraphs) with `&nbsp;`.
If I want to add a `~` character, I can write `&#126;`.

    renderer = new marked.Renderer()
    {paragraph} = renderer
    renderer.paragraph = (text) ->
        return paragraph text.replace /~/g, '&nbsp;'

Override the `marked` function by a new one with the custom renderer. 

    marked = do (marked) ->
        return (text) ->
            return marked text,
                renderer: renderer

### Render html

    options = safeLoad readFileSync process.argv[3], 'utf8'
    options.markdown = marked
    html = renderFile process.argv[2], options

### Write the output

    if process.argv[4]?
        writeFileSync process.argv[4], html
    else
        console.log html
