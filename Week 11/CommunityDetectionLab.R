# Load igraph
library(igraph)

# Create g1
g1 <- graph.formula(A-B-C-A,D-E-F-D,G-H-I-G,A-D-G-A)
V(g1)$grp_good <- c(1,1,1,2,2,2,3,3,3)
V(g1)$grp_bad <- c(1,2,3,2,3,1,3,1,2)

# Plot
op <- par(mfrow=c(1,2))
plot(g1,vertex.color=(V(g1)$grp_good),
     vertex.size=20,
     main="Good Grouping")
plot(g1,vertex.color=(V(g1)$grp_bad),
     vertex.size=20,
     main="Bad Grouping")
par(op)

# Calculate Modularity for good group
modularity(g1,V(g1)$grp_good)

# Calculate Modularity for bad group
modularity(g1,V(g1)$grp_bad)

# The DHHS network
library(intergraph)
library(UserNetR)
data(DHHS)
iDHHS <- asIgraph(DHHS)

# Count the number of agents by agency
table(V(iDHHS)$agency)

# Get the agencies of the first 10 agents
V(iDHHS)[1:10]$agency

modularity(iDHHS,(V(iDHHS)$agency+1))

# The Moreno Data
data(Moreno)
iMoreno <- asIgraph(Moreno)
table(V(iMoreno)$gender)

# Calculate Modularity by gender
modularity(iMoreno,V(iMoreno)$gender)

# Facebook data
data(Facebook)
Facebook <- upgrade_graph(Facebook)
levels(factor(V(Facebook)$group))

# convert groups to numerics
grp_num <- as.numeric(factor(V(Facebook)$group))

# Calculate Modularity
modularity(Facebook,grp_num)

# Community Detection in igraph

# Moreno data
# Cluster Walktrap
cw <- cluster_walktrap(iMoreno)
membership(cw)
modularity(cw)

# Plot
plot(cw,iMoreno)

# DHHS data
# Cluster walktrap
cw <- cluster_walktrap(iDHHS)
membership(cw)
modularity(cw)

# Create a table of the membership
table(V(iDHHS)$agency,membership(cw))

# Plot
plot(cw,iDHHS)

# The Bali data
data(Bali)
iBali <- asIgraph(Bali)

# Cluster walktrap
cw <- cluster_walktrap(iBali)
membership(cw)
modularity(cw)

# Cluster edge-betweenness
ceb <- cluster_edge_betweenness(iBali)
membership(ceb)
modularity(ceb)

# Cluster Spinglass
cs <- cluster_spinglass(iBali)
membership(cs)
modularity(cs)

# Cluster fastgreedy
cfg <- cluster_fast_greedy(iBali)
membership(cfg)
modularity(cfg)

# Cluster label propagation
clp <- cluster_label_prop(iBali)
membership(clp)
modularity(clp)

# Cluster leading Eigenvector
cle <- cluster_leading_eigen(iBali)
membership(cle)
modularity(cle)

# Cluster Louvain
cl <- cluster_louvain(iBali)
membership(cl)
modularity(cl)

# Cluster optimal
co <- cluster_optimal(iBali)
membership(co)
modularity(co)

# Load the xUCINET library
library(xUCINET)

# Convert Bali into an adj matrix
Bali_adj <- as.matrix(Bali)

# Calculate Girvan-Newman on Bali_adj with different k
gn <- xGirvanNewman(Bali_adj, 2)

# Calculate Modularity
modularity(iBali,gn[,1])
