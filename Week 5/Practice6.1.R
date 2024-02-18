# Load the xUCINET library
library(xUCINET)

# Load the Borgatti_Cities network
net <- Borgatti_Cities
summary(net)
net

# Multidimensional scaling of the distance between cities
RESULTS1<-xMDS(Borgatti_Cities$Distance, Distance=c(1,4))

# Plot the eigenvalues
plot(RESULTS1$eig, type = "l")

# Load the Greenacre_DoctoratesByYearAndField network
net2 <- Greenacre_DoctoratesByYearAndField
summary(net2)
net2

# Perform Correspondence Analysis on net2
xCorrespondenceAnalysis(net2)

# Create a random network
F63_DC<-xDegreeCentrality(ASNR_Fig06x3)[,2]*100
F63_CC<-xClosenessCentrality(ASNR_Fig06x3)[,2]*100
F63_BC<-xBetweennessCentrality(ASNR_Fig06x3)[,2]*100
F63_EC<-xEigenvectorCentrality(ASNR_Fig06x3)[,1]*40.5/0.286
F63<-cbind(F63_DC,F63_CC,F63_BC,F63_EC)
colnames(F63)<-c("Degree","Closeness","Betweenness","Eigenvector")
F63

# Apply Correspondence Analysis to F63
xCorrespondenceAnalysis(F63)

# Hierarchical clustering of the network
# Apply the hierarchical clustering algorithm to net
xHierarchicalClustering(net$Distance, Input="Differences", Method="single")
