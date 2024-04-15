# Bipartite networks and node and whole network level measures

# Load xUCINET library
library(xUCINET)

# Load statnet
library(statnet)

# Bipartite networks

# Load the attendance dataset
attend <- attend

# Convert two-mode to bipartite
xTwoModeToBipartite(attend)

# Plotting the network using the sna package. To do this we will shorten the 
# names of the women so they fit inside the round shapes.

DIM1<-dim(attend)
#To be able to use different colors and shapes, for the one mode and the second 
# mode, we create a vector with 0 for actors and 1 for events. 
RC1<-c(rep(0, DIM1[1]),rep(1, DIM1[1]))
RC1

#We also create our own labeling:
LABELS1<-c(substr(rownames(attend),1,2),colnames(attend))
LABELS1

# Plot
gplot(attend, 
      mode = "fruchtermanreingold", 
      gmode="twomode", 
      #Labels
      displaylabels=TRUE, 
      label = LABELS1, 
      label.cex=.7,
      label.pos=5,
      #Edges
      usearrows=FALSE,
      #Vertices
      vertex.cex=RC1*.5+1.7, 
      vertex.rot=45, 
      vertex.col=RC1*7)

# Centrality measures and local measures of position

# Degree of attendees
xDegreeCentrality(attend)

# Degree of events
xDegreeCentrality(t(attend))

# Or we can use the bipartite network and calculate closeness centrality for 
# example, taking into account that the normalization will be incorrect:
BIP<-xTwoModeToBipartite(attend)
xClosenessCentrality(BIP)

# Group-level measures

# Density of the network
xDensity(attend)
