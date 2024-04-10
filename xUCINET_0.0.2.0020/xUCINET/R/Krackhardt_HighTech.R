#' Network ties among managers in a high-tech company collected by Krackhardt.
#'
#' These are data collected by David Krackhardt among the managers of a high-tech company. The company manufactured high-tech equipment on the West Coast of the United States and had just over 100 employees with 21 managers. Contains three types of network relations and four attributes.
#'
#' @format A list object (xUCINET project/dataset) containing 3 networks and 4 attributes
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
#' Krackhardt_HighTech
#'
#' @references {See $ProjectInfo$References}
"Krackhardt_HighTech"

