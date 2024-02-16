# Initial variables
# Adjacency matrix
netmat1 <- rbind(c(0,1,1,0,0),
                 c(0,0,1,1,0),
                 c(0,1,0,0,0),
                 c(0,0,0,0,0),
                 c(0,0,1,0,0))

# Edge list
netmat2 <- rbind(c(1,2),
                 c(1,3),
                 c(2,3),
                 c(2,4),
                 c(3,2),
                 c(5,3))

# Like Matrix
netval1 <- rbind(c(0,2,3,0,0),
                 c(0,0,3,1,0),
                 c(0,1,0,0,0),
                 c(0,0,0,0,0),
                 c(0,0,2,0,0))

# Load the statnet library
library(statnet)

# Create a network from adjacency matrix
netmat1
rownames(netmat1) <- c("A","B","C","D","E")
colnames(netmat1) <- c("A","B","C","D","E")

# Create a network from netmat1
net1 <- network(netmat1, matrix.type="adjacency")

# Check the class of net1
class(net1)
# Get a summary of net1
summary(net1)

# Plot the network
# displaylabels = TRUE will display the node names
gplot(net1, vertex.col=2, displaylabels = TRUE)

# Create a network from edge list
# matrix.type="edgelist" is used to specify that the matrix is an edge list
net2 <- network(netmat2, matrix.type="edgelist")
# Change the names of the nodes
network.vertex.names(net2) <- c("A","B","C","D","E")
# Get a summary of net2
summary(net2)

# Verify that net1 is the same as ne2
# The as.sociomatrix() function is used to convert the network to a matrix
as.sociomatrix(net1)
class(as.sociomatrix(net1))

# One way of comparing the two networks is to convert them to matrices and compare them
# using the == operator. The mean() function is used to get the average of the comparison
# The result is 1, which means that the two networks are the same
mean(as.sociomatrix(net1) == as.sociomatrix(net2)) == 1

# Another way is to use the all() function on the comparison
all(as.matrix(net1) == as.sociomatrix(net2))

# Attributes

# Node attributes
# Using the set.vertex.attribute() function
set.vertex.attribute(net1, "gender", c("F", "F", "M", "F", "M"))

# Using the %v% operator
# The %v% operator is used to access the node attributes
net1 %v% "degree" <- degree(net1)

# Edge attributes

# Using the set.edge.attribue() function
set.edge.attribute(net1, "weight", runif(network.size(net1),0,1))

runif(network.size(net1),0,1) # random numbers between 0 and 1 the size of the network

# # Using the %e% operator
# The %e% operator is used to access the edge attributes
net1 %e% "weight" <- runif(network.size(net1),0,1)

summary(net1)

list.edge.attributes(net1)

# Netval1 - Like network
# the ignore.eval=FALSE argument is used to specify that the matrix has edge values
# the names.eval="like" argument is used to specify the name of the edge attribute
netval <- network(netval1, matrix.type="adjacency",
                  ignore.eval=FALSE,
                  names.eval="like")

summary(netval)
network.vertex.names(netval) <- c("A", "B", "C", "D", "E")

list.edge.attributes(netval)

get.edge.attribute(netval, "like")

as.sociomatrix(netval, attrname="like")

# iGraph
# The detach() function is used to detach the statnet library
detach("package:statnet", unload=TRUE)

# Load igraph
library(igraph)

# Create network from adjacency matrix in igraph
inet1 <- graph.adjacency(netmat1)

summary(inet1)

# Create network from edge list in igraph
inet2 <- graph.edgelist(netmat2)

summary(inet2)

# Install intergraph
install.packages("intergraph")

# load intergraph
library(intergraph)

# convert net1 to igraph network
inet1 <- asIgraph(net1)
class(inet1)

# Done with igraph, detach it
detach("package:igraph", unload=TRUE)

# Load statnet again
library(statnet)


# Filtering
# based on node values
# Filter "F" from net1
# The which() function is used to get the indices of the nodes with the specified attribute
net1f <- get.inducedSubgraph(net1, which(net1 %v% "gender" == "F"))

gplot(net1f, vertex.col=2, displaylabels = TRUE)

# based on degree
net1d <- get.inducedSubgraph(net1, which(net1 %v% "degree" > 1))

# Using the %s% operator
net1d <- net1 %s% which(net1 %v% "degree" > 1)

gplot(net1d, vertex.col=2, displaylabels = TRUE)

# Real dataset
# Install another library from github
library(devtools)

install_github("DougLuke/UserNetR")

# Load the library
library(UserNetR)

data("ICTS_G10")
net <- ICTS_G10

# Calculate the density of the network
gden(net)
summary(net)
gplot(net, vertex.col=2)

# remove isolates
# In this case, we use the which() function to get the indices of the nodes with degree 0
net <- delete.vertices(net, which(degree(net) == 0))

gplot(net, vertex.col=2)

gden(net)

# Filtering based on edge values

data(DHHS)

net2 <- DHHS

gden(net2)

gplot(net2, vertex.col=2)

# We convert the network to a matrix and filter the values

net2filt <- as.sociomatrix(net2, attrname="collab")
# We set the values less than 3 to 0
net2filt[net2filt < 3] <- 0

net2filt <- as.network(net2filt, matrix.type="adjacency",
                       ignore.val=FALSE,
                       names.eval="collab")

gplot(net2filt, vertex.col=2)

# To convert a not-directed graph into a directed graph, we use the symmetrize() function
#The rules used by symmetrize are as follows:
#upper: Copy the upper triangle over the lower triangle
#lower: Copy the lower triangle over the upper triangle
#strong: i<->j iff i->j and i<-j (AND rule)
#weak: i<->j iff i->j or i<-j (OR rule)
?symmetrize

net1dir <- symmetrize(net1, rule="weak")
