# Load the igraph library
library(igraph)

# Cliques ----

# Create a clique example
clqexmp <- graph.formula(A:B:C:D--A:B:C:D,D-E,E-F-G-E)

# Plot the clique example
plot(clqexmp)

# Get the number of nodes in the largest clique
clique.number(clqexmp)

# Get a list of all cliques
cliques(clqexmp, min=3)

# Find the largest clique
largest.cliques(clqexmp)

# Create a bunch of networks
g25 <- erdos.renyi.game(25, 75, type="gnm")
g50 <- erdos.renyi.game(50, 150, type="gnm")
g100 <- erdos.renyi.game(100, 300, type="gnm")
g500 <- erdos.renyi.game(500, 1500, type="gnm")
nodes <- c(25,50,100,500)
# Get clique information for all above networks
lrgclq <- c(clique.number(g25),clique.number(g50),
            clique.number(g100),clique.number(g500))
numclq <- c(length(cliques(g25,min=3)),
            length(cliques(g50,min=3)),
            length(cliques(g100,min=3)),
            length(cliques(g500,min=3)))
clqinfo <- data.frame(Nodes=nodes,Largest=lrgclq,
                      Number=numclq)
# Print the clique information
print(clqinfo)

# k-cores ----

# Load the UserNetR library
library(UserNetR)

# Load the DHHS networks
data(DHHS)

# Load the intergraph library
library(intergraph)

# Convert the DHHS data into an igraph network
iDHHS <- asIgraph(DHHS)

# Calculate the density of the iDHHS network
graph.density(iDHHS)

# Getting edge of type collab > 2
iDHHS <- subgraph.edges(iDHHS,E(iDHHS)[collab > 2])

# Calculate the new density
graph.density(iDHHS)

# Calculate the coreness of the iDHHS network
coreness <- graph.coreness(iDHHS)

# Print the results as a table
table(coreness)

# Find the max coreness
maxCoreness <- max(coreness)

# Plotting gives us a better understanding of k-core

# Get the vertices names
Vname <- get.vertex.attribute(iDHHS,name='vertex.names',
                              index=V(iDHHS))

V(iDHHS)$name <- Vname
V(iDHHS)$color <- coreness + 1
op <- par(mar = rep(0, 4))
plot(iDHHS,vertex.label.cex=0.8)
par(op)

# Label the nodes with their k-core membership value
colors <- rainbow(maxCoreness)
op <- par(mar = rep(0, 4))
plot(iDHHS,vertex.label=coreness,
     vertex.color=colors[coreness])
par(op)
