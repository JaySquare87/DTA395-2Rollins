#' Zachary's University Karate Club
#'
#' Network data among 34 members of a university karate club collected by Wayne Zachary between 1970 and 1972. Zachary (1977) used these data and an information flow model of network conflict resolution to explain the split-up of this group following disputes among the members.
#'
#' @format A list object (xUCINET project/dataset) containing 2 networks and 3 attributes
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
#' Zachary_KarateClub
#'
#' @references {See $ProjectInfo$References}
"Zachary_KarateClub"

