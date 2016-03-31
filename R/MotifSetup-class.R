#' MotifSetup Reference Class
#' 
#' This class is used to initialize motif plots and mix them with track plots. 
#' 
#' @details
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
#' Usage note - the \code{addMotif} and \code{addBigWig} methods can be chained
#' in following way: \code{MotifSetup()$addMotif("GAGA",
#' window=200L)$addBigWig("path/to/file.bw")}
=======
#' Usage note - the \code{addMotif} and \code{addBigWig} methods can be chained in following way:
#' \code{MotifSetup()$addMotif("GAGA", window=200L)$addBigWig("path/to/file.bw")}
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
#' 
#' @field data a nested list holding the data
#' @field annotations list of annotations
#' 
#' @family classes
#' @export MotifSetup
#' @exportClass MotifSetup
#' 
#' @examples
#' 
#' #Motifs only
#' motif1 <- MotifSetup()
#' motif1$addMotif("GAGA", window=200L)
#' motif1$addMotif("TATA", window=100L, name="TATA box")
#' 
#' #Motifs and BigWigs
#' motif2 <- MotifSetup()
#' motif2$addMotif("GAGA", window=200L)
#' motif2$addBigWig("path/to/file.bw")
#' 
#' #Chaining commands
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
#' motif3 <- MotifSetup()$addMotif("GAGA")$addBigWig("path/to/file.bw")
=======
#' motif3 <- MotifSetup()$addMotif("GAGA", window=200L)$addBigWig("path/to/file.bw")
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
#'  
MotifSetup <- setRefClass("MotifSetup", 
    fields = list( data = "list", annotations = "list" ),
    methods = list( 
        nmotifs = function() {
            "Prints number of motifs in class"
            length(data) 
        },
        show = function() {
            "Show method"
            cat( 'MotifSetup with', nmotifs(), 'motifs/tracks.' ) 
        },
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
        addMotif = function(
            pattern, window=200L, heatmap=TRUE, revcomp=TRUE, genome=NULL, 
            name=pattern ) {
            
            "Adds new motif."
            ind <- length(data)+1
            data[[ind]] <<- list(
                pattern=pattern, window=window, heatmap=heatmap, 
                revcomp=revcomp, genome=genome, name=name
            )
=======
        addMotif = function(pattern, window=200L, heatmap=TRUE, revcomp=TRUE, genome=NULL, name=pattern ) {
            "Adds new motif."
            ind <- length(data)+1
            data[[ind]] <<- list(pattern=pattern, window=window, heatmap=heatmap, revcomp=revcomp, genome=genome, name=name)
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
            names(data)[[ind]] <<- name
            return(.self)
        },
        addBigWig = function(file_path) {
            "Adds new BigWig file."
            data[[length(data)+1]] <<- file_path
            return(.self)
        }
    )
)
