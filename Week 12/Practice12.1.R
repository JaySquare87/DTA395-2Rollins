# Load the xUCINET library
library(xUCINET)

# load statnet
library(statnet)

# Load the Sampson Monastery data
esteem <- Sampson_Monastery$Esteem
disesteem <- Sampson_Monastery$Disesteem

gplot(esteem, gmode="graph")
gplot(disesteem, gmode="graph")

# Find structural equivalence
xStructuralEquivalence(list(esteem, disesteem),
                       Method = "Euclidean",
                       IncludeTransposed = TRUE,
                       Choiceij = "OnlyReciprocal",
                       DigitRound = 2)
?xStructuralEquivalence # to learn more about this function

# Profile Similarity and clusters

# Store the above results in a variable
SMED_EuclideanSE <- xStructuralEquivalence(list(esteem, disesteem),
                       Method = "Euclidean",
                       IncludeTransposed = TRUE,
                       Choiceij = "OnlyReciprocal",
                       DigitRound = 2)

# Create a dendrogram of the structural equivalence results
xHierarchicalClustering(SMED_EuclideanSE,
                        Input = "Differences",
                        Method = "ward.D")

# Extract 5 clusters only from the dendrogram
xHierarchicalClustering(SMED_EuclideanSE,
         Input = "Differences",
         Method = "ward.D",
         NOC = 5)


# Extract both the 3- and 4- cluster solutions
xHierarchicalClustering(SMED_EuclideanSE,
         Input = "Differences",
         Method = "ward.D",
         NOC = c(3,4))
