# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

## JJ Centralization
JJCentralization <- function (NET1) 
{
  options(scipen = 100)
  if (is.matrix(NET1) == F) {
    stop(" .  ### Network file NET1 needs to be of class \"matrix\" ###")
  }
  if (sum(is.na(NET1)) > 0) {
    stop(" .  ## Matrix should not contain NAs")
  }
  if (sum(NET1 != 0 & NET1 != 1) > 0) {
    stop(" .  ## Matrix should be binary (0 and 1 values only)")
  }
  NR1 <- dim(NET1)[1]
  NC1 <- dim(NET1)[2]
  if (NR1 == NC1) {
    if ((NET1 == t(NET1)[1])) { # bug in this line. missing any()
      NV <- 2
    }
    else {
      NV <- 1
    }
  }
  else {
    NV <- 0
  }
  if (NR1 == NC1) {
    diag(NET1) <- 0
  }
  DCEN1 <- rowSums(NET1, na.rm = T)
  OUTPUT1 <- sum(max(DCEN1) - DCEN1)/((NR1 - 1) * (NC1 - NV))
  OUTPUT1
}

# Degree centralization

# Plot the Advice network
gplot(Krackhardt_HighTech$Advice, vertex.col = 1.5)

# Measure the centralization of the Advice network
JJCentralization(Krackhardt_HighTech$Advice)
# Measure the centraliztion of the transpose of the Advice network
JJCentralization(t(Krackhardt_HighTech$Advice))

# Plot the Friendship network
gplot(Krackhardt_HighTech$Friendship, vertex.col = 1.5)

# Measure the centralization of the Friendship network
JJCentralization(Krackhardt_HighTech$Friendship)
# Measure the centraliztion of the transpose of the Friendship network
JJCentralization(t(Krackhardt_HighTech$Friendship))

# Plot the ReportTo network
gplot(Krackhardt_HighTech$ReportTo, vertex.col = 1.5)

# Measure the centralization of the ReportTo network
JJCentralization(Krackhardt_HighTech$ReportTo)
# Measure the centraliztion of the transpose of the ReportTo network
JJCentralization(t(Krackhardt_HighTech$ReportTo))
