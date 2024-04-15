# Structural equivalence

# Load the xUCINET library
library(xUCINET)

# Load the Davis_SouthernWomen dataset
attend <- Davis_SouthernWomen$Attendance

# Calculate the structural equivalence
SEM2A <- xStructuralEquivalence(attend)

SEM2B <- xStructuralEquivalence(t(attend))

# Cluster using hierarchical clustering based on the structural equivalence
CL1 <- xHierarchicalClustering(SEM2A, 
                               Input = "Differences", 
                               Method = "average",
                               NOC = 3)
CL2 <- xHierarchicalClustering(SEM2B, 
                               Input = "Differences", 
                               Method = "average",
                               NOC = 3)

# Load the blockmodeling library
library(blockmodeling)

# Create a block model matrix based on the two clusters above.
plot.mat(attend, clu = list(CL1, CL2))
