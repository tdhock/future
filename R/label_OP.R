#' Specify label for a future assignment
#'
#' @usage fassignment \%label\% label
#'
#' @param fassignment The future assignment, e.g.
#'        \code{x \%<-\% \{ expr \}}.
#' @inheritParams multiprocess
#'
#' @export
`%label%` <- function(fassignment, label) {
  fassignment <- substitute(fassignment)
  envir <- parent.frame(1)

  ## Temporarily set 'label' argument
  args <- getOption("future.disposable", list())
  args["label"] <- list(label)
  options(future.disposable = args)
  
  eval(fassignment, envir=envir)
}
