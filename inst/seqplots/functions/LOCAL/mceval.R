mceval <- function(do, do.iter=NULL, do.final=NULL, ...) {
  
  if(is.null(isolate(values$proc))) {
    values$proc <- parallel::mcparallel(do)
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    invalidateLater(500, session)
    
  } else if ( is.null(parallel:::selectChildren(isolate(values$proc))) ) {
    parallel::mccollect( isolate(values$proc) ); values$proc <- NULL 
    session$sendCustomMessage("jsExec", "$('#progressModal').modal('hide'); alert('Job canceled!');")
    if(!is.null(values$progress)) values$progress$close()
=======
    invalidateLater(100, session)
    
  } else if ( is.null(parallel:::selectChildren(isolate(values$proc))) ) {
    parallel::mccollect( isolate(values$proc) ); values$proc <- NULL 
    session$sendCustomMessage("jsExec", "$('#progressModal').modal('hide'); alert('Job canceled.');")
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    
  } else if( parallel:::selectChildren(isolate(values$proc)) == parallel:::processID(isolate(values$proc)) ) {
    res <- parallel::mccollect(isolate(values$proc), wait=FALSE)[[1]]
    
    if(class(res) == 'try-error' ) {
      parallel::mccollect( isolate(values$proc) ); values$proc <- NULL 
      session$sendCustomMessage("jsAlert", res); session$sendCustomMessage("jsExec", "$('#progressModal').modal('hide');")
      
    } else if ( is.null(res) ) {
      parallel::mccollect( isolate(values$proc) ); values$proc <- NULL 
      session$sendCustomMessage("jsExec", "$('#progressModal').modal('hide'); alert('Job canceled.');")
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
      if(!is.null(values$progress)) values$progress$close()
=======
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
      
    } else {
      parallel::mccollect( isolate(values$proc) )
      values$proc <- NULL 
      session$sendCustomMessage("jsExec", "$('#progressModal').modal('hide').find('#summary2').text('')")      
      eval( do.final )
      
    }
    
  } else { 
    if(!is.null(do.iter)) eval( do.iter ) 
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    invalidateLater(500, session); 
    
  }  
}
=======
    invalidateLater(100, session); 
    
  }  
}
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
