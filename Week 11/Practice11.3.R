# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# Fast Greedy Algorithm

# Perform xFastGreedy() function on the Zachary_KarateClub$Connection network
xFastGreedy(Zachary_KarateClub$Connection, vertex.label.cex=.7, vertex.shape=UseShapes[ZKAttrClub])

# Walktrap Algorithm

# Perform xWalkTrap() function on the Zachary_KarateClub$Connection network
xWalkTrap(Zachary_KarateClub$Connection, vertex.label.cex = .7, vertex.shape=UseShapes[ZKAttrClub])

# Louvain Algorithm

# Perform xLouvainMethod() function on the Zachary_KarateClub$Connection network
xLouvainMethod(Zachary_KarateClub$Connection, vertex.label.cex=.7, vertex.shape=UseShapes[ZKAttrClub])

# Label Propagation

# Perform xLabelPropagation() function on the Zachary_KarateClub$Connection network
xLabelPropagation(Zachary_KarateClub$Connection, vertex.label.cex=.7, vertex.shape=UseShapes[ZKAttrClub])
