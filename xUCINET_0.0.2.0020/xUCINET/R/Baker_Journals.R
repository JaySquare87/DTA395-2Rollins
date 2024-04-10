#' Citation network among social work journals collected by Baker.
#'
#' Donald Baker collected data on the citations among 20 social work journals for 1985-1986. The data consist of the number of citations from articles in one journal to articles in another journal. Using hierarchical cluster analysis, he found that the network seems to have a core-periphery structure, and argues that American journals tend to be less likely to involve international literature.
#'
#' @format A list object (xUCINET project/dataset) containing 1 network and no attributes
#'  \describe{
#'  \item{$ProjectInfo}{- Contains a series of elements and descriptions: $ProjectName, $GeneralDescription, $AttributesDescription, $NetworksDescription, $References}
#'  \item{$Attributes}{- A data.frame with attributes for nodes}
#'  \item{$NetworkInfo}{- A data.frame with additional information about each network: $Name, $Mode, $Directed, $Diagonal, £Values, $Class}
#'  \item{$Citations}{- Network1. See $ProjectInfo$NetworksDescription for more information}
#'  }
#'
#' @source {UCINET}
#'
#' @examples
#' Baker_Journals
#'
#' @references {See $ProjectInfo$References}
"Baker_Journals"
