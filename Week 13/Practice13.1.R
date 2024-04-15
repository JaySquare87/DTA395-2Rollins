# One-mode projections of two-mode data

# Load xUCINET library
library(xUCINET)

# Load statnet
library(statnet)

# Simple convertion of two-mode data into a one-mode network

# Load the attendance dataset
attend <- Davis_SouthernWomen$Attendance

# Convert two-mode to one
temp <- xTwoModeToOneMode(attend)

# Plot
WBW<-xTwoModeToOneMode(attend)
gplot(WBW>2, 
     gmode="graph", 
     #Labels
     displaylabels = TRUE, 
     label.cex=.7,
     #Edges
     edge.lwd=WBW*1.5-4,
     #Vertices
     vertex.cex=.7, 
     vertex.col=7,
     edge.col = "grey65",
     label.pos = 3)


# One-mode projection using Bonacich’s normalization method

EBE <- xTwoModeToOneMode(t(attend), Measure="Bonacich")*100
round(EBE)

# Plot
gplot(EBE>50, 
      gmode="graph", 
      displaylabels = TRUE,
      #Label
      label.cex=.7,
      label.pos=5,
      #Edge
      edge.lwd=(EBE>50)*(EBE-45)/14,
      #Vertex
      vertex.sides=4,
      vertex.cex=1.9,
      vertex.rot=45,
      vertex.col=7
      )
