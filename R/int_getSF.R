<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
getSF  <- function(genome, gr, pattern, bin, nbins, simple=TRUE, revcomp=FALSE) {
=======
getSF  <- function(genome, gr, pattern, bin, simple=TRUE, revcomp=FALSE) {
    
    sl <- median(width(gr))
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    
    grf <- trim(resize(gr, width(gr)+(bin*2), fix='center'))
    seqs <- getSeq(genome,  grf)
    
    pattern <- DNAString(pattern)
    
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    hits <- vmatchPattern(pattern, seqs, algorithm="naive-exact")
    hits <- resize( as(hits, "CompressedIRangesList"), bin, fix='center')
    
    if(!revcomp) {
        cover <- coverage(hits, width=width(seqs))
    } else {
        rhits <- vmatchPattern(
            reverseComplement(pattern), seqs, algorithm="naive-exact"
        )
        rhits <- resize( as(rhits, "CompressedIRangesList"), bin, fix='center')
        cover <- coverage(hits, width=width(seqs)) + coverage(rhits, width=width(seqs))
    }
    out <- sapply(cover, function(x) {
        vec <- as.numeric(x)[(bin+1):(length(x) - bin)]
        if(length(vec) < 2) {
            rep(vec, nbins)
        } else {
            approx(vec, n=nbins)$y
        }
    })
    return( t(out) )
=======
    if (simple) {
        #Simle line plot
        hits <- unlist( vmatchPattern(pattern, seqs, algorithm="naive-exact") )
        if(revcomp) {
            hits <- c(hits, 
                      unlist( vmatchPattern(
                          reverseComplement(pattern), 
                          seqs, algorithm="naive-exact") ))
        }
        vec <- coverage( 
            restrict(resize( hits, bin, fix='center'), 
                start=1, end=sl+(2*bin), keep.all.ranges=TRUE, use.names=FALSE
            )) / length(grf)
        vec <- as.numeric( as.numeric(vec)[bin:(bin+sl)] )
        
        return( rbind(vec) )
    } else {
        #Line plot wit error bars and/or heatmap
        npl_count <- function(hits, bin, seqs, sl, pattern) {
            pos <- start(rd) +     ( floor(nchar(as.character(pattern))/2) -1  )
            nviews <- max(width(seqs)) - bin + 1L
            idx <- logical(max(width(seqs)))
            ex <- -seq_len( bin - 1L )
            
            out <- lapply(pos, function(x) { 
                idx[x] <- TRUE; 
                NLP0 <- cumsum(idx)
                NLP1 <- NLP0[ex]
                length(NLP1) <- nviews
                NLP2 <- c(0L, NLP0)
                length(NLP2) <- nviews
                return(NLP1 - NLP2)
            } )
            M <- do.call(rbind, out)
            M <- M[ ,(bin/2):((bin/2)+sl)] 
            return( M )
        }
        #Matrix-like results
        rd <- as(vmatchPattern(pattern, seqs, algorithm="naive-exact"), 
                 "CompressedIRangesList")
        out <- npl_count(rd, bin, seqs, sl, pattern)
        
        if(revcomp) {
            rd.rev <- as(
                vmatchPattern(reverseComplement(pattern), 
                              seqs, algorithm="naive-exact"), 
                "CompressedIRangesList")
            out <- out + npl_count(rd.rev, bin, seqs, sl, pattern)
        }
        return( out )
    }
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
}
