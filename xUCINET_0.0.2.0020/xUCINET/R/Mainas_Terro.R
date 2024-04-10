#' Contacts among people collected as part of counter-terrorism/Europol.
#'
#' Data obtained by Efstathios Mainas from Europol. Were collected and analyzed by both the Counter-Terrorism Unit and the Analysis Unit of Europol. Edges are the known contacts of the actors - the specific type of linkage was not revealed.
#'
#' @format A list object (xUCINET project/dataset) containing 1 network stored as an edgelist.
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
#' Mainas_Terro
#'
#' @references {See $ProjectInfo$References}
"Mainas_Terro"

