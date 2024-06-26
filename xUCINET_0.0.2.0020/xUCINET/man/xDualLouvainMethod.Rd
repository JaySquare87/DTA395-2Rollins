% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xTwoMode.R
\name{xDualLouvainMethod}
\alias{xDualLouvainMethod}
\title{Performs a dual projection using the Louvain Method.}
\usage{
xDualLouvainMethod(NET2)
}
\arguments{
\item{NET2}{A single two-mode network stored in an R object as a matrix.}
}
\value{
A membership
}
\description{
Performs a separate community detection analysis (Louvain) on row and column nodes using one-mode projections.
}
\examples{
xDualLouvainMethod(Davis_SouthernWomen$Attendance)
}
