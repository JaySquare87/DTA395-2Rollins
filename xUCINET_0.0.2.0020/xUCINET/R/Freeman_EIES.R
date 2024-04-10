#' Freeman's EIES network dataset
#'
#' This data arose from an early experiment on computer mediated communication. Fifty academics interested in interdisciplinary research were allowed to contact each other via an Electronic Information Exchange System (EIES). The data collected consisted of all messages sent as well as acquaintance relationships at two time periods (collected via a questionnaire). The data includes the 32 actors who completed the study. In addition, attribute data on primary discipline and number of citations was recorded.
#'
#' @format A list object (xUCINET project/dataset) containing 3 networks and 2 attributes
#'  \describe{
#'   \item{$ProjectInfo}{- Contains a series of elements and descriptions: $ProjectName, $GeneralDescription, $AttributesDescription, $NetworksDescription, $References}
#'   \item{$Attributes}{- A data.frame with attributes for nodes}
#'   \item{$NetworkInfo}{- A data.frame with additional information about each network: $Name, $Mode, $Directed, $Diagonal, £Values, $Class}
#'   \item{$Strength}{- Network1. See $ProjectInfo$NetworksDescription for more information}
#'   \item{$Connection}{- Network2. See $ProjectInfo$NetworksDescription for more information}
#'   }
#' @source UCINET
#' @references See $ProjectInfo$References
"Freeman_EIES"
