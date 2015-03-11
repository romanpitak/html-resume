
    NodePDF = require('nodepdf');


    options =
        viewportSize:
            width: '210mm'
            height: '290mm'
        paperSize:
            pageFormat: 'A4'
            margin:
                top: '0cm'
                left: '0cm'
                right: '0cm'
                bottom: '0cm'
        zoomFactor: 1

    pdf = new NodePDF process.argv[2], process.argv[3], options
    pdf.on 'error', console.error
    pdf.on 'done', console.log.bind(console, 'PDF file written at')
    pdf.on 'stdout', console.log.bind(console, 'PhantomJS: ')

listen for stderr from phantomjs

    pdf.on 'stderr', console.error.bind(console, 'PhantomJS: ')
