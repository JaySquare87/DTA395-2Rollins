#' Savage's transaction flows between countries
#'
#' This data contain data about transaction flows between 15 countries prior to the economic crash of 1929, as reported by Savage and Deutsch in their paper in 1960.
#'
#' @format A list object (xUCINET project/dataset) containing 1 network and 2 attributes
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
#' Savage_TransactionFlows
#'
#' @references {See $ProjectInfo$References}
"Savage_TransactionFlows"
