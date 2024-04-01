# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# Perform xGirvanNewman() function on the Zachary_KarateClub$Connection network
xGirvanNewman(Zachary_KarateClub$Connection, vertex.label.cex=.7)

# Repeat but this time with 2 clusters
xGirvanNewman(Zachary_KarateClub$Connection, NOC=2, vertex.label.cex=.7)

# Verify visually
## Define the shapes to be used
UseShapes<-c("circle","rectangle")
## Define the vector for nodes -
ZKAttrClub<-(Zachary_KarateClub$Attributes$Club>1)+1
xGirvanNewman(Zachary_KarateClub$Connection, vertex.shape=UseShapes[ZKAttrClub],
              vertex.label.cex=.7)

# Test again with 2 clusters
xGirvanNewman(Zachary_KarateClub$Connection, NOC=2, vertex.shape=UseShapes[ZKAttrClub],
              vertex.label.cex=.7)

# Clustering on the Kapferer's Tailor Shop Network
xGirvanNewman(Kapferer_TailorShop$SociationalT1, vertex.label.cex=.7)

# 8 clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=8, vertex.label.cex=.7)

# 9 Clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=9, vertex.label.cex=.7)

# 10 Clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=10, vertex.label.cex=.7)

# 11 Clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=11, vertex.label.cex=.7)

# 12 Clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=12, vertex.label.cex=.7)

# 20 Clusters
xGirvanNewman(Kapferer_TailorShop$SociationalT1, NOC=20, vertex.label.cex=.7)
