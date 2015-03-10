# Builder

load modules

    {readFileSync, writeFileSync} = require 'fs'
    {render} = require 'jade'
    {safeLoad} = require 'js-yaml'
    marked = require 'marked'

render html

    content = readFileSync process.argv[2], 'utf8'
    options = safeLoad readFileSync process.argv[3], 'utf8'
    options.filename = process.argv[3]
    options.markdown = marked
    html = render content, options

write the output

    if process.argv[4]?
        writeFileSync process.argv[4], html
    else
        console.log html
