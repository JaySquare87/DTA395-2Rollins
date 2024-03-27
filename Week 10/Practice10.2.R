# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)


par(mfrow=c(2,3))
gplot(ASNR_Fig10x3A, displaylabels=T, gmode="graph", label.pos = 3)
gplot(ASNR_Fig10x3B, displaylabels=T, gmode="graph", label.pos = 3)
gplot(ASNR_Fig10x3C, displaylabels=T, gmode="graph", label.pos = 3)
gplot(ASNR_Fig10x3D, displaylabels=T, gmode="graph", label.pos = 3)
gplot(ASNR_Fig10x3E, displaylabels=T, gmode="graph", label.pos = 3)
par(mfrow=c(1,1))

# Component sizes
xComponents(ASNR_Fig10x3A)
xComponents(ASNR_Fig10x3B)
xComponents(ASNR_Fig10x3C)
xComponents(ASNR_Fig10x3D)
xComponents(ASNR_Fig10x3E)

# Component ratio
temp <- xComponents(ASNR_Fig10x3B)
(temp["Number of components", "Value"] - 1) / 
  (temp["Number of nodes", "Value"] - 1)

# Exercise 2
# Connectedness/fragmentation

xConnectedness(ASNR_Fig10x3A)
xConnectedness(ASNR_Fig10x3B)
xConnectedness(ASNR_Fig10x3C)
xConnectedness(ASNR_Fig10x3D)
xConnectedness(ASNR_Fig10x3E)

# Exercise 3
# Compactness/breadth

xCompactness(ASNR_Fig10x3A)
xCompactness(ASNR_Fig10x3B)
xCompactness(ASNR_Fig10x3C)
xCompactness(ASNR_Fig10x3D)
xCompactness(ASNR_Fig10x3E)

# Exercise 4
# Proportion reached

# Proportions of alters reached within 2 steps
xProportionReach(ASNR_Fig10x3A)
xProportionReach(ASNR_Fig10x3B)
xProportionReach(ASNR_Fig10x3C)
xProportionReach(ASNR_Fig10x3D)
xProportionReach(ASNR_Fig10x3E)

# Proportions of alters reached in a maximum of 3 steps
xProportionReach(ASNR_Fig10x3A, kReach=3)
xProportionReach(ASNR_Fig10x3B, kReach=3)
xProportionReach(ASNR_Fig10x3C, kReach=3)
xProportionReach(ASNR_Fig10x3D, kReach=3)
xProportionReach(ASNR_Fig10x3E, kReach=3)

# Proporations of alters reached in a maximum of 4 steps
xProportionReach(ASNR_Fig10x3A, kReach=4)
xProportionReach(ASNR_Fig10x3B, kReach=4)
xProportionReach(ASNR_Fig10x3C, kReach=4)
xProportionReach(ASNR_Fig10x3D, kReach=4)
xProportionReach(ASNR_Fig10x3E, kReach=4)
