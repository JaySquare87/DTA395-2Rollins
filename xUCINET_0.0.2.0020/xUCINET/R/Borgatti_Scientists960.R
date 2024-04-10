#' Collaboration among 960 scientists.
#'
#' These data indicate the amount of time (in days, and rounded to the nearest day) that scientists at a large applied research institute worked on projects together. The data are derived from a 2-mode matrix (960 persons by 3154 projects) in which the cells indicated how much time each scientist worked on each project. The 1-mode projection was achieved by the sum of minimums method. For example, if person A spent 1 day on project 1 and 3 days on project 2, and person B spent 5 days on project 1 and 2 days on project 2, the amount of time worked together is 1+2 = 3 days.
#'
#' @format A list object (xUCINET project/dataset) containing 1 networks and 3 attributes
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
#' Borgatti_Scientists960
#'
#' @references {See $ProjectInfo$References}
"Borgatti_Scientists960"

