# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# Cliques and Clique Overlaps ----

# Clique Membership
Hawthorne_BankWiring$ProjectInfo

# Plot the Game Network
par(mar = c(0, 0, 0, 0))
gplot(Hawthorne_BankWiring$Game, displaylabels = T, gmode="graph")

# Create a matrix of the clique membership with a minimum of 3 members
xCliquesMembership(Hawthorne_BankWiring$Game, Min=3)

# Create a matrix of the clique membership with a minimum of 5 members
xCliquesMembership(Hawthorne_BankWiring$Game, Min=5)

# Clique comembership

# Create a matrix of the clique comembership in the Game network
xCliquesCoMembership(Hawthorne_BankWiring$Game)

# Create a matrix of the clique comembership in the Game network with a 
# minimum of 5 members
xCliquesCoMembership(Hawthorne_BankWiring$Game, Min=5)

# Clustering Based on Clique Comembership

# Create a matrix of the clique comembership in the Game network with a
# minimum of 3 members
CO<-xCliquesCoMembership(Hawthorne_BankWiring$Game, Min=3)

# Use the xHierarchicalClustering() function to create a dendrogram
xHierarchicalClustering(CO, Method="average", Input="Similarities")
