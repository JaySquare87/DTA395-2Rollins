# Community detection and core-periphery structures

# Load the xUCINET library
library(xUCINET)

# Load the attendance data
attend <- Davis_SouthernWomen$Attendance

#3 Dual projection for community detection
CL2 <- xDualLouvainMethod(attend)

# Install the blockmodeling package
install.packages("blockmodeling")

# Create a block model matrix from the clusters above
library(blockmodeling)

plot.mat(attend, clu=CL2)

# Dual projection for core-periphery
CL2 <- xDualCorePeriphery(attend)

# Create a block model matrix from the clusters above
plot.mat(attend, clu=CL2)
