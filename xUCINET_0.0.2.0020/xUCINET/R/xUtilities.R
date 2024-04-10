# utility functions for xUCINET

#' @export
xIsValid <- function(x)
{
  v = !is.na(x) & is.finite(x)
  return(v)
}

#' @export
xxt <- function(x)
{
  return(tcrossprod(x,x))
}

#' @export
xIsDirected <- function(x)
{
  return(any(x != t(x)))
}

#' @export
xmodestr <- function(isdir)
{
  if(isdir) {
    modes<-"directed"
  } else {modes <- "undirected"}
  return(modes)
}

#' @export
xigraph<-function(x,dir=NA)
{
  if(is.na(dir)){
    dir <- xIsDirected(x)
  }
  return(graph.adjacency(x, mode=xmodestr(dir), diag=F))
}
#
