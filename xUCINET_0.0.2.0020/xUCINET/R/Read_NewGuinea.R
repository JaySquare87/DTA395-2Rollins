#' Network ties among Gahuku-Gama sub-tribes
#'
#' This data contain the social relations between Gahuku-Gama sub-tribes in NewGuinea as reported in Read (1954). Political (alliance) ties and opposition ties are reported.
#'
#' @format A list object (xUCINET project/dataset) containing 2 networks and no attributes
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
#' Read_NewGuinea
#'
#' @references {See $ProjectInfo$References}
"Read_NewGuinea"
