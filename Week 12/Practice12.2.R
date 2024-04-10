# Blockmodels

# Load the xUCINET library
library(xUCINET)

# Load the Sampson Monastery data
esteem <- Sampson_Monastery$Esteem
disesteem <- Sampson_Monastery$Disesteem

# Structural equivalence and clusters

# Obtain the structural equivalence matrix using Pearson's colleration 
# coefficient
SMED_PearsonSE<-xStructuralEquivalence(list(Sampson_Monastery$Esteem>0,Sampson_Monastery$Disesteem>0),
                          Method="Pearson",
                          IncludeTransposed=TRUE, 
                          Choiceij="Ignore",
                          DigitRound=4)

# Use the xHierarchicalClustering function to create a dendrogram of the
# structural equivalence results and obtain the 4-cluster solution
SMED_HC <- xHierarchicalClustering(SMED_PearsonSE,
                        Input="Similarities",
                        Method="single",
                        NOC=4)

# Blockstructures based on clusters from structural equivalence

# Calculate the density for each of the 16 blocks for both esteem and disesteem
xDensity(esteem>0, ROWS = SMED_HC, COLS = SMED_HC)
xDensity(disesteem>0, ROWS = SMED_HC, COLS = SMED_HC)

# Visualize using blocks and reorganized by partition
xBlockmodel(esteem>0, ATTR1 = SMED_HC)
xBlockmodel(disesteem>0, ATTR1 = SMED_HC)
