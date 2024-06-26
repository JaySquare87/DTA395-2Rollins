% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xTransformations.R
\name{xAttributeToNetwork}
\alias{xAttributeToNetwork}
\title{Converts an attribute into a network}
\usage{
xAttributeToNetwork(ATT1, Type = "Same")
}
\arguments{
\item{ATT1}{The attribute vector to be used.}

\item{Type}{The conversion to be used. The options are: "Same" (gives 1 for ij if i and j have the same value),
"AbsDiff" (where ij is the absolute difference in value between i and j),
"Diffij" (where ij is the difference: i - j),
"Diffji" (where ij is the difference: j - i),
"Sender" (where ij is the value for i),
"Received" (where ij is the value for j).}
}
\value{
An network.
}
\description{
This function converts an attribute vector into a network.
}
\examples{
A1<-c(1,3,1,2,2,3,1,3)
xAttributeToNetwork(A1, Type="Same")
}
