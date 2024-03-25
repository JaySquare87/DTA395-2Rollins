# Load the xUCINET library
library(xUCINET)

# Load the statnet library
library(statnet)

# Exercise 1 ----
# Density and average degree

# Advice network

gplot(Krackhardt_HighTech$Advice, gmode = "graph", vertex.col = 1.5)

xDensity(Krackhardt_HighTech$Advice)

mean(xDegreeCentrality(Krackhardt_HighTech$Advice)[,1], na.rm=T)

# Friendship network

gplot(Krackhardt_HighTech$Friendship, gmode = "graph", vertex.col = 1.5)

xDensity(Krackhardt_HighTech$Friendship)

mean(xDegreeCentrality(Krackhardt_HighTech$Friendship)[,1], na.rm=T)

# ReportTo network

gplot(Krackhardt_HighTech$ReportTo, gmode = "graph", vertex.col = 1.5)

xDensity(Krackhardt_HighTech$ReportTo)

mean(xDegreeCentrality(Krackhardt_HighTech$ReportTo)[,1], na.rm=T)

# Exercise 2 ----
# Reciprocity

# Advice network

xReciprocity(Krackhardt_HighTech$Advice)

# Friendship network
xReciprocity(Krackhardt_HighTech$Friendship)

# ReportTo network
xReciprocity(Krackhardt_HighTech$ReportTo)

# Exercise 3 ----
# Transitivity and cyclicality

# Advice network
xTransitivity(Krackhardt_HighTech$Advice)
xCyclicality(Krackhardt_HighTech$Advice)

# Friendship network
xTransitivity(Krackhardt_HighTech$Friendship)
xCyclicality(Krackhardt_HighTech$Friendship)

# ReportTo network
xTransitivity(Krackhardt_HighTech$ReportTo)
xCyclicality(Krackhardt_HighTech$ReportTo)
