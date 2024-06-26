% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xSubgroupsCommunity.R
\name{xCliquesOverlap}
\alias{xCliquesOverlap}
\title{Provides the cliques-overlap based on a one-mode network}
\usage{
xCliquesOverlap(NET1, Min = 3)
}
\arguments{
\item{NET1}{A binary, undirected one-mode network stored as a 'matrix' object.}

\item{Min}{The minimum size for cliques being considered. By default a clique has at least 3 nodes.}
}
\value{
A matrix where each row and column are unique cliques found, and the values are the number of nodes two cliques have in common.
}
\description{
Using an binary, undirected one-mode network (NET1), this function calculates all the maximum cliques in a network and then defines for the each pair of cliques how many nodes they have in common.
The network should be a binary and undirected one-mode network.
}
\examples{
## Examples of undirected networks (See chapter 11 of Borgatti et al., 2022):
xCliquesOverlap(Hawthorne_BankWiring$Game)
}
\references{
Chapter 11. Borgatti, S. P., Everett, M. G., Johnson, J. C., & Agneessens, F. (2022). Analyzing Social Networks Using R. SAGE.
igraph package - https://igraph.org
}
\seealso{
\code{\link[=xCliquesMembership]{xCliquesMembership()}}, \code{\link[=xCliquesMembership]{xCliquesMembership()}}, \code{\link[igraph:cliques]{igraph::max_cliques()}}
}
