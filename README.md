# My CV generator

This strives to be a fairly universal CV generator.
The text content (except for the headings) is written in `YAML`,
the semantic structure in `Jade` and styles in `Sass`.
Source code for sections is split into separate files in `src/mixins`.

The renderers are written in `Literate CoffeeScript`.

## Usage

Generate html:

    make

Generate pdf:

    make pdf

Development:

    make watch

Requires `coffee` and `sass` for all jobs and `phantomjs` for pdf generation.
