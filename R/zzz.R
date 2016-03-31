.onAttach <- function(libname, pkgname) {
    #Fix for annoying BiocGenerics namespace problems
    if(!"package:BiocGenerics" %in% search()) attachNamespace('BiocGenerics')
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    packageStartupMessage(paste(
        'SeqPlots ready, type "run()" to start web interface (GUI) or',
        '"?getPlotSetArray" for console mode help.'
    ))
=======
    packageStartupMessage('SeqPlots ready, type "run()" to start web interface (GUI) or "?getPlotSetArray" for console mode help.')
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
}
