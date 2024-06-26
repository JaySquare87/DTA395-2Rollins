% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xCentrality.R
\name{xBetaCentrality}
\alias{xBetaCentrality}
\title{Calculates Beta centrality (Bonacich's power centrality)}
\usage{
xBetaCentrality(NET1, Beta = NA, Diagonal = FALSE, Option = "None")
}
\arguments{
\item{NET1}{A one-mode or two-mode network stored as a 'matrix' object.}

\item{Beta}{A single value or vector contain Beta values which need to be smaller than 1/highest eigenvalue.}

\item{Diagonal}{Logical statement, whether diagonal should be included.}

\item{Option}{The normalization chosen, which can be one of the following "None" (no normalization), "MAX1" (set maximum value to 1), "SUM1" (set sum of values to 1), "SSQ1" (set sum of squares equal to 1), "SSQN"  (set sum of squares equal to number of nodes)}
}
\value{
A matrix with Beta centrality values.
}
\description{
Calculates the Beta centrality for a one-mode network, where Beta can be a
vector of values or a single value, but must be smaller than 1/highest eigenvalue.
Can to be 'problematic' for directed networks.
Values can be binary or valued. For valued networks.
Different normalizations are available in Option.
No missing data are allowed.
\itemize{
\item Last updated: 1 February 2022.
}
}
\examples{
## Undirected one-mode network
xBetaCentrality(ASNR_Fig09x3, c(0,.1,.2,.3,.4,-.1,-.2), Option="SSQN")

## Directed one-mode network
xBetaCentrality(ASNR_Fig09x4, Beta=c(0,1,10,100,1000) , Option="SSQN")
xBetaCentrality(t(ASNR_Fig09x4), Beta=c(0,1,10,100,1000) , Option="SSQN")

}
