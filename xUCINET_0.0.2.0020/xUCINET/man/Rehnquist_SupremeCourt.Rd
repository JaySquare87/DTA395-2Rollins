% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Rehnquist_SupremeCourt.R
\docType{data}
\name{Rehnquist_SupremeCourt}
\alias{Rehnquist_SupremeCourt}
\title{Voting among US Supreme Court Justices}
\format{
A list object (xUCINET project/dataset) containing 1 networks and no attributes
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
Rehnquist_SupremeCourt
}
\description{
This data contains the voting behavior among Supreme Court Justices of the United States between 1995 and 2004. From 1986 to 2005 the chief justice was William Hubbs Rehnquist. The data consist of a 2-mode matrix in which the rows are court cases and the columns are judges. A cell (i,j) = 1 if judge j voted with the majority on case i.
}
\examples{
Rehnquist_SupremeCourt

}
\references{
{See $ProjectInfo$References}
}
\keyword{datasets}
