#' Two-mode network of Southern women attending events.
#'
#' These data were collected by Davis, Gardner and Gardner in the 1930s. They represent attendance at 14 social events by 18 Southern women. The result is a person-by-event matrix, with people in the rows and events in the columns. A cell (i,j) is 1 if person i attended social event j, and 0 otherwise. (See also Chapter 13 of Borgatti et al., 2022).
#'
#' @format A list object (xUCINET project/dataset) containing 1 two-mode networks and no attributes
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
#' Davis_SouthernWomen
#'
#' @references {See $ProjectInfo$References}
"Davis_SouthernWomen"

