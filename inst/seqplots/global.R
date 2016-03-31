#if( !'seqplots' %in% .packages() ) {
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
suppressPackageStartupMessages({
    require(parallel)
    require(shiny)
    require(jsonlite)
=======
  suppressPackageStartupMessages({
    require(parallel)
    require(shiny)
    require(RJSONIO)
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    require(RSQLite)
    require(rtracklayer)
    require(BSgenome)
    require(kohonen)
    require(Cairo)
    require(plotrix)
    require(fields)
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    library(RColorBrewer) 
    library(seqplots)
})
#}


if(Sys.getenv('root') == '' ) {
  source('server_config.R')
}
.libPaths(c( .libPaths(), file.path(Sys.getenv('root'), 'genomes') ))

options(shiny.deprecation.messages=FALSE)
=======
  })
#}

GENOMES <- BSgenome:::installed.genomes(splitNameParts=TRUE)$provider_version
if( length(GENOMES) ) 
  names(GENOMES) <- gsub('^BSgenome.', '', BSgenome:::installed.genomes())

if(Sys.getenv('root') == '' ) {
  source('server_config.R')
}
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
