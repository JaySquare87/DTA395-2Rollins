# load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# JJ Density
JJDensity <- function (NET1, Diagonal = FALSE, ROWS = "All", COLS = "All", 
                       Option = "Mean") 
{
  options(scipen = 100)
  if (!Option %in% c("Mean", "Sum")) {
    stop(" .  ### The argument (Option) should be \"Mean\" or \"Sum\" ###")
  }
  if (is.matrix(NET1) == F) {
    stop(" .  ### Network file NET1 needs to be of class \"matrix\" ###")
  }
  NR1 <- dim(NET1)[1]
  NC1 <- dim(NET1)[2]
  if ((Diagonal == FALSE & NR1 == NC1)[1]) {
    diag(NET1) <- NA
  }
  if ((Diagonal == FALSE & NR1 != NC1)[1]) {
    cat("\n", " .  == == == == == == == == == == == == == == == == == == == == == ==", 
        "\n", " .   ## WARNING about argument: (Diagonal=FALSE)", 
        "\n", " .   ## The input is a two-mode network, and therefore the default", 
        "\n", " .   ## setting of removing the \"diagonal\" values is ignored.", 
        "\n", " .  == == == == == == == == == == == == == == == == == == == == == ==", 
        "\n")
  }
  if (length(ROWS) == 1) {
    if (ROWS == "All") {
      AG_R <- 1
    }
    if (ROWS == "Unique") {
      AG_R <- (-1)
    }
  }
  else {
    AG_R <- 0
  }
  if (length(COLS) == 1) {
    if (COLS == "All") {
      AG_C <- 1
    }
    if (COLS == "Unique") {
      AG_C <- (-1)
    }
  }
  else {
    AG_C <- 0
  }
  if (AG_R == 1 & AG_C == 1) {
    SUMF <- sum(NET1, na.rm = T)
    SUMFVAL <- sum(!is.na(NET1))
  }
  if (AG_R == -1 & AG_C == -1) {
    SUMF <- NET1
    SUMFVAL <- 1
  }
  if (AG_R == -1 & AG_C == 1) {
    SUMF <- t(t(rowSums(NET1, na.rm = TRUE)))
    SUMFVAL <- t(t(rowSums(!is.na(NET1), na.rm = TRUE)))
    if (is.null(rownames(NET1))) {
      NAMESR <- c(1:NC1)
    }
    else {
      NAMESR <- rownames(NET1)
    }
    rownames(SUMF) <- NAMESR
    colnames(SUMF) <- "All"
  }
  if (AG_R == 1 & AG_C == -1) {
    SUMF <- t(colSums(NET1, na.rm = TRUE))
    SUMFVAL <- t(colSums(!is.na(NET1), na.rm = TRUE))
    if (is.null(colnames(NET1))) {
      NAMESC <- c(1:NC1)
    }
    else {
      NAMESC <- colnames(NET1)
    }
    colnames(SUMF) <- NAMESC
    rownames(SUMF) <- "All"
  }
  if (AG_R == 0) {
    if (!is.matrix(ROWS) & !is.vector(ROWS)) {
      stop("\n", " .  ###  Attribute file for rows (ROWS) needs to be of class \"matrix\" or \"vector\"", 
           "\n")
    }
    if (is.matrix(ROWS)) {
      if (min(dim(ROWS)) != 1) {
        stop("\n", " .  ###  Attribute file for rows (ROWS) needs to be a single row or column", 
             "\n")
      }
    }
    if (is.matrix(ROWS)) {
      NAR <- max(dim(ROWS))
    }
    else {
      NAR <- length(ROWS)
    }
    if (NAR != NR1) {
      stop("\n", " .  ###  Attribute file for rows (ROWS) needs to have the same length as the number of rows of the matrix (NET1)", 
           "\n")
    }
  }
  if (AG_C == 0) {
    if (!is.matrix(COLS) & !is.vector(COLS)) {
      stop("\n", " .  ###  Attribute file for columns (COLS) needs to be of class \"matrix\" or \"vector\"", 
           "\n")
    }
    if (is.matrix(COLS)) {
      if (min(dim(COLS)) != 1) {
        stop("\n", " .  ###  Attribute file for columns (COLS) needs to be a single row or column", 
             "\n")
      }
    }
    if (is.matrix(COLS)) {
      NAC <- max(dim(COLS))
    }
    else {
      NAC <- length(COLS)
    }
    if (NAC != NC1) {
      stop("\n", " .  ###  Attribute file for columns (COLS) needs to have the same length as the number of columns of the matrix (NET1)", 
           "\n")
    }
  }
  if (AG_R == 0 & AG_C == 0) {
    SUM1 <- sapply(by(NET1, ROWS, FUN = colSums, na.rm = T), 
                   identity)
    SUMF <- sapply(by(SUM1, COLS, FUN = colSums, na.rm = T), 
                   identity)
    SUM1VAL <- sapply(by(!is.na(NET1), ROWS, FUN = colSums, 
                         na.rm = T), identity)
    SUMFVAL <- sapply(by(SUM1VAL, COLS, FUN = colSums, na.rm = T), 
                      identity)
  }
  if (AG_R == 0 & AG_C == -1) {
    if (is.null(colnames(NET1))) {
      NAMESC <- c(1:NC1)
    }
    else {
      NAMESC <- colnames(NET1)
    }
    SUMF <- t(sapply(by(NET1, ROWS, FUN = colSums, na.rm = T), 
                     identity))
    colnames(SUMF) <- NAMESC
    SUMFVAL <- t(sapply(by(!is.na(NET1), ROWS, FUN = colSums, 
                           na.rm = T), identity))
  }
  if (AG_R == 0 & AG_C == 1) {
    SUM1 <- t(sapply(by(NET1, ROWS, FUN = colSums, na.rm = T), 
                     identity))
    SUMF <- t(t(rowSums(SUM1, na.rm = TRUE)))
    SUM1VAL <- t(sapply(by(!is.na(NET1), ROWS, FUN = colSums, 
                           na.rm = T), identity))
    SUMFVAL <- t(t(rowSums(SUM1VAL, na.rm = TRUE)))
    colnames(SUMF) <- c("All")
  }
  if (AG_R == -1 & AG_C == 0) {
    if (is.null(rownames(NET1))) {
      NAMESR <- c(1:NR1)
    }
    else {
      NAMESR <- rownames(NET1)
    }
    SUMF <- sapply(by(t(NET1), COLS, FUN = colSums, na.rm = T), 
                   identity)
    rownames(SUMF) <- NAMESR
    SUMFVAL <- sapply(by(t(!is.na(NET1)), COLS, FUN = colSums, 
                         na.rm = T), identity)
  }
  if (AG_R == 1 & AG_C == 0) {
    SUM1 <- sapply(by(t(NET1), COLS, FUN = colSums, na.rm = T), 
                   identity)
    SUMF <- t(colSums(SUM1, na.rm = TRUE))
    SUM1VAL <- sapply(by(t(!is.na(NET1)), COLS, FUN = colSums, 
                         na.rm = T), identity)
    SUMFVAL <- t(colSums(SUM1VAL, na.rm = TRUE))
    rownames(SUMF) <- c("All")
  }
  if (Option == "Mean") {
    OUTPUT1 <- SUMF/SUMFVAL
  }
  if (Option == "Sum") {
    OUTPUT1 <- SUMF
  }
  NOTMISSING <- sum(!is.na(NET1))
  if ((Diagonal == FALSE & NR1 == NC1)[1]) {
    NPOSS <- NR1 * (NR1 - 1)
  }
  else {
    NPOSS <- NR1 * NC1
  }
  cat("\n", " .  ------------------------------------------------------------------ ", 
      "\n", " .   Number of valid cells:", NOTMISSING, "\n", 
      " .   which corresponds to:", NOTMISSING/(NPOSS) * 100, 
      "% of considered cells.", "\n", " .  ------------------------------------------------------------------ ", 
      "\n\n")
  OUTPUT1
}

# Trying Density by Attribute
JJDensityByAttribute <- function(networkMatrix, nodeAttributes) {
  # Ensure the network matrix is square
  if (nrow(networkMatrix) != ncol(networkMatrix)) {
    stop("The network matrix must be square.")
  }
  
  # Ensure the length of nodeAttributes matches the size of the matrix
  if (length(nodeAttributes) != nrow(networkMatrix)) {
    stop("The length of nodeAttributes must match the size of the network matrix.")
  }
  
  # Loop through each unique attribute
  for(attribute in unique(nodeAttributes)) {
    nodesWithAttribute <- which(nodeAttributes == attribute)
    
    if (length(nodesWithAttribute) > 1) { # Only consider attributes shared by 2 or more nodes
      totalPossibleConnections <- choose(length(nodesWithAttribute), 2)
      actualConnections <- 0
      
      # Calculate actual connections for nodes with this attribute
      for (i in nodesWithAttribute) {
        for (j in nodesWithAttribute) {
          if (i < j) { # To avoid double counting and counting self-loops
            actualConnections <- actualConnections + as.numeric(networkMatrix[i, j] != 0)
          }
        }
      }
      
      # Calculate and print density for the attribute
      density <- actualConnections / totalPossibleConnections
      cat(sprintf("Density for attribute '%s': %f\n", attribute, density))
    } else {
      # Print a message for attributes with only one node
      cat(sprintf("Density for attribute '%s': NA (not applicable, only one node)\n", attribute))
    }
  }
}

# Trying Cohesion by Attribute
JJGroupCohesionByAttribute <- function(networkMatrix, nodeAttributes) {
  # Ensure the network matrix is square
  if (nrow(networkMatrix) != ncol(networkMatrix)) {
    stop("The network matrix must be square.")
  }
  
  # Ensure the length of nodeAttributes matches the size of the matrix
  if (length(nodeAttributes) != nrow(networkMatrix)) {
    stop("The length of nodeAttributes must match the size of the network matrix.")
  }
  
  # Loop through each unique attribute
  for(attribute in unique(nodeAttributes)) {
    nodesWithAttribute <- which(nodeAttributes == attribute)
    
    if (length(nodesWithAttribute) > 1) { # Only consider attributes shared by 2 or more nodes
      totalPossibleConnections <- choose(length(nodesWithAttribute), 2)
      actualConnections <- 0
      degreeVariance <- 0
      degrees <- rep(0, length(nodesWithAttribute))
      
      # Calculate actual connections and degree for each node
      for (i in 1:length(nodesWithAttribute)) {
        for (j in 1:length(nodesWithAttribute)) {
          if (i != j) { # Avoid self-loops
            if (networkMatrix[nodesWithAttribute[i], nodesWithAttribute[j]] != 0) {
              actualConnections <- actualConnections + 1
              degrees[i] <- degrees[i] + 1
            }
          }
        }
      }
      
      # Calculate density
      density <- actualConnections / totalPossibleConnections
      
      # Calculate variance in degrees
      if (length(degrees) > 1) {
        degreeVariance <- var(degrees)
      }
      
      # Assume group cohesion is inversely related to degree variance; lower variance means higher cohesion
      # Normalize variance to a 0-1 scale (for simplicity, this example will not do that) and subtract from density
      # This is a simplistic model for demonstration purposes
      cohesion <- density - (degreeVariance / max(1, totalPossibleConnections))
      
      cat(sprintf("Group cohesion for attribute '%s': %f\n", attribute, cohesion))
    } else {
      # Print a message for attributes with only one node
      cat(sprintf("Group cohesion for attribute '%s': NA (not applicable, only one node)\n", attribute))
    }
  }
}

# Trying Cohesion for Network Type
JJGroupCohesionForNetworkType <- function(networkMatrix, nodeAttributes) {
  # Ensure the network matrix is square
  if (nrow(networkMatrix) != ncol(networkMatrix)) {
    stop("The network matrix must be square.")
  }
  
  # Ensure the length of nodeAttributes matches the size of the matrix
  if (length(nodeAttributes) != nrow(networkMatrix)) {
    stop("The length of nodeAttributes must match the size of the network matrix.")
  }
  
  # Loop through each unique attribute
  for(attribute in unique(nodeAttributes)) {
    nodesWithAttribute <- which(nodeAttributes == attribute)
    
    if (length(nodesWithAttribute) > 1) { # Only consider attributes shared by 2 or more nodes
      totalPossibleConnections <- choose(length(nodesWithAttribute), 2)
      actualConnections <- 0
      degrees <- rep(0, length(nodesWithAttribute))
      
      # Calculate actual connections and degree for each node
      for (i in 1:length(nodesWithAttribute)) {
        for (j in 1:length(nodesWithAttribute)) {
          if (i != j) { # Avoid self-loops
            if (networkMatrix[nodesWithAttribute[i], nodesWithAttribute[j]] != 0) {
              actualConnections <- actualConnections + 1
              degrees[i] <- degrees[i] + 1
            }
          }
        }
      }
      
      # Calculate density
      density <- actualConnections / (totalPossibleConnections * 2) # Adjust for directed edges
      
      # Calculate variance in degrees as a measure of evenness
      degreeVariance <- var(degrees)
      
      # Calculate cohesion (consider both density and degree variance)
      cohesion <- density - (degreeVariance / max(1, totalPossibleConnections))
      
      cat(sprintf("Group cohesion for attribute '%s': %f\n", attribute, cohesion))
    } else {
      # Print a message for attributes with only one node
      cat(sprintf("Group cohesion for attribute '%s': NA (not applicable, only one node)\n", attribute))
    }
  }
}

# Trying a generalized network cohesion
JJAdviceNetworkCohesion <- function(networkMatrix, nodeAttributes) {
  # Ensure the network matrix is square
  if (nrow(networkMatrix) != ncol(networkMatrix)) {
    stop("The network matrix must be square.")
  }
  
  # Ensure the length of nodeAttributes matches the size of the matrix
  if (length(nodeAttributes) != nrow(networkMatrix)) {
    stop("The length of nodeAttributes must match the size of the network matrix.")
  }
  
  # Calculate Intra-group cohesion
  cat("Intra-group Cohesion:\n")
  for(attribute in unique(nodeAttributes)) {
    nodesWithAttribute <- which(nodeAttributes == attribute)
    
    if (length(nodesWithAttribute) > 1) {
      totalPossibleConnections <- length(nodesWithAttribute)^2 - length(nodesWithAttribute)
      actualConnections <- sum(networkMatrix[nodesWithAttribute, nodesWithAttribute])
      density <- actualConnections / totalPossibleConnections
      cat(sprintf(" - Attribute '%s': %f\n", attribute, density))
    } else {
      cat(sprintf(" - Attribute '%s': NA (not applicable, only one node)\n", attribute))
    }
  }
  
  cat("\nInter-group Cohesion:\n")
  # Calculate Inter-group cohesion
  attributes <- unique(nodeAttributes)
  for(i in 1:(length(attributes) - 1)) {
    for(j in (i + 1):length(attributes)) {
      nodesGroup1 <- which(nodeAttributes == attributes[i])
      nodesGroup2 <- which(nodeAttributes == attributes[j])
      
      connections12 <- sum(networkMatrix[nodesGroup1, nodesGroup2])
      connections21 <- sum(networkMatrix[nodesGroup2, nodesGroup1])
      
      totalConnections <- connections12 + connections21
      if(totalConnections > 0) {
        reciprocity <- min(connections12, connections21) / totalConnections
      } else {
        reciprocity <- NA
      }
      
      cat(sprintf(" - Between '%s' and '%s': %s\n", attributes[i], attributes[j], ifelse(is.na(reciprocity), "NA (no connections)", reciprocity)))
    }
  }
}

# I GAVE UP



# Group cohesion

# We could start by simply creating the density within and between each group

# Advice network
JJDensity(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
xGroupsCohesion(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
JJDensityByAttribute(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
JJGroupCohesionByAttribute(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
JJGroupCohesionForNetworkType(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
JJAdviceNetworkCohesion(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)

# Friendship network
JJDensity(Krackhardt_HighTech$Friendship, Krackhardt_HighTech$Attributes$Department)

# Measure of homophily
# To obtain measures of homophily, you can simply use the xGroupHomophily function.

# Advice
xGroupHomophily(Krackhardt_HighTech$Advice,Krackhardt_HighTech$Attributes$Department)
#In these results,
#-a refers to the count of the number of homophilous ties that exist between nodes who are the same on some characteristics.
#-b refers to heterophilous ties present,
#-c refers to the number of homophilous dyads with no tie, and
#-d to the number of heteropholous dyads with no tie.
#-%homoph is the percentage homophilous ties, i.e., the proportion of ties between homophilous dyads divided by the total number of ties (or a/(a+b))
#-EI is an index of heterophily ((b-a)/(b+a)), where -1 indicates perfect homophily, and 1 indicates perfect homophily
#-normEI provides the reference point for the expected value, if there is no tendency towards homophily or heterophily
#-YulesQ gives the value for homophily taking into account the non-ties, and therefore is a measure of a propensity above chance. Yule’s Q is defined as ((ad)-(bc))/((ad)+(bc))
#-PearsonPhi refers to Pearson’s Phi, which is ((ad)-(bc))/((a+c).5+(b+d).5+(a+b).5+(c+d).5)

# Friendship
xGroupHomophily(Krackhardt_HighTech$Friendship,Krackhardt_HighTech$Attributes$Department)
