
    NodePDF = require('nodepdf');


    options =
        viewportSize:
            width: 1440
            height: 900
        paperSize:
            pageFormat: 'A4'
            margin:
                top: '0.7cm'
                left: '0.7cm'
                right: '0.7cm'
                bottom: '0.7cm'
        footer:
            height: '1cm',
            contents: '{currentPage} / {pages}'
        zoomFactor: 0.75

    pdf = new NodePDF process.argv[2], process.argv[3], options
    pdf.on 'error', console.error
    pdf.on 'done', console.log.bind(console, 'PDF file written at')
    pdf.on 'stdout', console.log.bind(console, 'PhantomJS: ')

listen for stderr from phantomjs

    pdf.on 'stderr', console.error.bind(console, 'PhantomJS: ')