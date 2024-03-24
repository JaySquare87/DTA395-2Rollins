# load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# Load tidyverse
library(tidyverse)


# Load figure 9.1 network
net1 <- ASNR_Fig09x1

# Use the xDegreeCentrality() function to calculate the degree centrality of the network
xDegreeCentrality(net1)

# A trick to convert the output of xDegreeCentrality() to a tibble
# In this case, we can arrange the nodes by degree centrality

# Create a tibble from the output of xDegreeCentrality()
dfDegree <- as_tibble(xDegreeCentrality(net1))
# Add the node names to the tibble using the mutate() function
dfDegree <- dfDegree |> mutate(node = rownames(net1))
# Arrange the tibble by degree centrality in descending order
dfDegree |> arrange(desc(Degree))

# We are repeating the same step as above. However, we are calculating the eigenvector centrality of the network
# Using the xEigenVectorCentrality() function
dfEigen1 <- as_tibble(xEigenvectorCentrality(net1))
dfEigen1 <- dfEigen1 |> mutate(node = rownames(net1))
dfEigen1 |> arrange(desc(Eigenvector))

# Load the ASNR_Fig09x2 network (Figure 9.2) to net2
net2 <- ASNR_Fig09x2

# Calculate the eigenvector centrality of the network
dfEigen2 <- as_tibble(xEigenvectorCentrality(net2))
dfEigen2 <- dfEigen2 |> mutate(node = rownames(net2))
dfEigen2 |> arrange(desc(Eigenvector))

# Calculate the beta centrality of the network
# 0.2 is the beta value
dfBeta <- as_tibble(xBetaCentrality(net2, 0.2))
dfBeta <- dfBeta |> mutate(node = rownames(net2))
dfBeta |> arrange(desc(Beta.0.2))

# The following code doesn't work because of a bug in the library
# Awaiting response from the developer
# However, you can run the below code providing each beta individually as
# we did above.
# The Option parameter determines the type of normalization to be used
# xBetaCentrality(ASNR_Fig09x3, c(0,.1,.2,.3,.4,-.1,-.2), Option="SSQN")

# Perform the closeness centrality on net1
dfClose <- as_tibble(xClosenessCentrality(net1))
dfClose <- dfClose |> mutate(node = rownames(net1))
# We store the arrangement of the nodes by closeness centrality in dfClose
# Since the table is large and can't be displayed fully in the Console pane
# You can open the data frame from the Environment pane
dfClose <- dfClose |> arrange(FreemanCloseness )

# Store the ASNR_Fig09x3 network in net3 (Figure 9.3)
net3 <- ASNR_Fig09x3

# Calculate the k-Reach centrality for k = 2
dfReach <- as.tibble(xReachCentrality(net3, kReach = 2))
dfReach <- dfReach |> mutate(node = rownames(net3))
dfReach |> arrange(desc(kReach.2))

# Calculate the Betweenness centrality for net1
dfBet <- as_tibble(xBetweennessCentrality(net1))
dfBet <- dfBet |> mutate(node = rownames(net1))
dfBet |> arrange(desc(Betweenness))

# Following the code in the practice to create the Sampson_Monastery network
NEG1 <- ((Sampson_Monastery$Disesteem+Sampson_Monastery$Dislike+Sampson_Monastery$Blame+Sampson_Monastery$NegativeInfluence)>0)*1
POS1<- ((Sampson_Monastery$Esteem+Sampson_Monastery$Praise+Sampson_Monastery$PositiveInfluence+Sampson_Monastery$LikeT3)>0)*1

# Calculating the negative degree centrality
POS2<-(POS1+t(POS1))>0
NEG2<-(NEG1+t(NEG1))>0
xNegativeDegreeCentrality(NEG2)

# Calculating the Induced Centrality for the Medici Marriage network
xInducedCentrality(Padgett_FlorentineFamilies$Marriage)

# plot the Padgett_FlorentineFamilies$Marriage network
gplot(Padgett_FlorentineFamilies$Marriage, gmode="graph", vertex.col=1.5)
xInducedCentrality(Padgett_FlorentineFamilies$Marriage)


# Load ASNR_Fig09x6 into net6 (Figure 9.6)
net6 <- ASNR_Fig09x6
gplot(net6, gmode="graph", 
      vertex.col="red", 
      displaylabels = TRUE,
      label.pos = 5)

# Induced Centrality for net6

xInducedCentrality(net6)
