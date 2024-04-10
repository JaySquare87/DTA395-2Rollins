#' Network ties among lawyers in a law firm.
#'
#' This data contain the social relations among 71 attorneys (partners and associates) in a Northeastern US corporate law firm between 1988-1991 in New England.
#'
#' @format A list object (xUCINET project/dataset) containing 3 networks and 7 attributes
#'  \describe{
#'  \item{$ProjectInfo}{ -  Contains a series of elements and descriptions: $ProjectName, $GeneralDescription, $AttributesDescription, $NetworksDescription, $References}
#'  \item{$Attributes}{ -  A data.frame with attributes for nodes}
#'  \item{$NetworkInfo}{ -  A data.frame with additional information about each network: $Name, $Mode, $Directed, $Diagonal, £Values, $Class}
#'  \item{$Strength}{ -  Network1. See $ProjectInfo$NetworksDescription for more information}
#'  \item{$Connection}{ -  Network2. See $ProjectInfo$NetworksDescription for more information}
#'  }
#'
#' @source {UCINET}
#'
#' @examples
#' Lazega_Lawyers
#'
#' @references {See $ProjectInfo$References}
"Lazega_Lawyers"

