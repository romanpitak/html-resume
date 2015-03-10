# Builder

load modules

    {readFileSync, writeFileSync} = require 'fs'
    {renderFile} = require 'jade'
    {safeLoad} = require 'js-yaml'
    marked = require 'marked'

render html

    options = safeLoad readFileSync process.argv[3], 'utf8'
    options.markdown = marked
    html = renderFile process.argv[2], options

write the output

    if process.argv[4]?
        writeFileSync process.argv[4], html
    else
        console.log html
