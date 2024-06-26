% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Borgatti_Cities.R
\docType{data}
\name{Borgatti_Cities}
\alias{Borgatti_Cities}
\title{Matrix capturing distances between US cities}
\format{
A list object (xUCINET project/dataset) containing 1 network and no attributes
\describe{
\item{$ProjectInfo}{ -  Contains a series of elements and descriptions: $ProjectName, $GeneralDescription, $AttributesDescription, $NetworksDescription, $References}
\item{$Attributes}{ -  A data.frame with attributes for nodes}
\item{$NetworkInfo}{ -  A data.frame with additional information about each network: $Name, $Mode, $Directed, $Diagonal, £Values, $Class}
\item{$Strength}{ -  Network1. See $ProjectInfo$NetworksDescription for more information}
\item{$Connection}{ -  Network2. See $ProjectInfo$NetworksDescription for more information}
}
}
\source{
{UCINET}
}
\usage{
Borgatti_Cities
}
\description{
This network contain the distance in miles between some of the major cities in the US. The distances are based on how many miles it takes to drive from one city to the other.
}
\examples{
Borgatti_Cities

}
\references{
{See $ProjectInfo$References}
}
\keyword{datasets}
