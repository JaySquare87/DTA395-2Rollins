# Subgroups

# Load the xUCINET library
library(xUCINET)

# Bicliques

# Get the attendance data
attend <- Davis_SouthernWomen$Attendance

# Calculate bi-cliques
BC <- xBiCliques(attend)

# Clustering of bicliques
BC %*% t(BC)

# Plot a dendrogram of the bicliques clusters

xHierarchicalClustering(BC %*% t(BC), Input = "Similarities", Method = "average")
