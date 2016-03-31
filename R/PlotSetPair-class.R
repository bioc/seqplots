#' PlotSetPair Reference Class
#'
#' @field means numeric vector of means
#' @field stderror numeric vector of standard errors
#' @field conint numeric vector of 95\% confidence intervals
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
#' @field all_ind numeric vector giving the relative position of the bins in the
#'   genome
#' @field numeric value giving the length of anchored distance, NULL for point
#'   feature plots
=======
#' @field all_ind numeric vector giving the relative position of the bins in the genome
#' @field numeric value giving the length of anchored distance, NULL for point feature plots
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
#' @field desc character string describing the PlotSetPair
#' @field heatmap numeric matrix used for plotting the heatmap
#' 
#' @family classes
#' @export
#' 
PlotSetPair <- setRefClass("PlotSetPair", 
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    fields = list(
        means='numeric', stderror='numeric', conint='numeric', 
        all_ind='numeric', e='ANY', desc='character', heatmap='matrix'
    ),
=======
    fields = list(means='numeric', stderror='numeric', conint='numeric', 
                  all_ind='numeric', e='ANY', desc='character', heatmap='matrix'),
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    methods = list(
        show = function() {
            cat( 'PlotSetPair contatining:', gsub('\n@', ' @ ', desc) )
        },
        as.list = function() {
            "Convert to PlotSetPair list."
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
            list(
                means=means, stderror=stderror, conint=conint, 
                all_ind=all_ind, e=e, desc=desc, heatmap=heatmap
            )
        },
        plot = function(what='a', ...) {
            "Plot the PlotSetPair class. See \\code{\\link{plot}} for datails."
            if (what=="a") plotAverage(list(.self), ...) 
                else if (what=="h") plotHeatmap(list(.self), ...) 
            else message(paste(
                'Unknown type of the plot, use what="a"',
                'for average plot and what="h" for heatmap'))
=======
            list(means=means, stderror=stderror, conint=conint, all_ind=all_ind, e=e, desc=desc, heatmap=heatmap)
        },
        plot = function(what='a', ...) {
            "Plot the PlotSetPair class. See \\code{\\link{plot}} for datails."
            if (what=="a") plotAverage(list(.self), ...) else if (what=="h") plotHeatmap(list(.self), ...) 
            else message('Unknown type of the plot, use what="a" for average plot and what="h" for heatmap')
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
        }
    )
)

