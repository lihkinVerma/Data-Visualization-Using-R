
#--------------------------------------------------
# Hexbin Plot
#--------------------------------------------------
# We can use the hexbin package in case we have multiple points 
# in the same place (overplotting). Hexagon binning is a form of bivariate 
# histogram useful for visualizing the structure in datasets with large n. 

library(hexbin)
library(ggplot2)
data(diamonds)
a=hexbin(diamonds$price,diamonds$carat,xbins=40)

library(RColorBrewer)
plot(a)

# for color palette
library(RColorBrewer)
rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
hexbinplot(diamonds$price~diamonds$carat, data=diamonds, colramp=rf)

#--------------------------------------------------
# Mosaic Plot
#--------------------------------------------------
# A mosaic plot can be used for plotting categorical data very 
# effectively with the area of the data showing the relative proportions.

data(HairEyeColor)
mosaicplot(HairEyeColor)

#--------------------------------------------------
# Heat Map
#--------------------------------------------------
# Heat maps enable you to do exploratory data analysis with two 
# dimensions as the axis and the third dimension shown by intensity of color. 
# However you need to convert the dataset to a matrix format. 

heatmap(as.matrix(mtcars))

# When to use: Heat Map uses intensity (density) of colors to display 
# relationship between two or three or many variables in a two dimensional 
# image. It allows you to explore two dimensions as the axis and the third 
# dimension by intensity of color.

nba <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", sep=",")
nba <- nba[order(nba$PTS),]
row.names(nba) <- nba$Name

nba <- nba[,2:20]

nba_matrix <- data.matrix(nba)
nba_heatmap <- heatmap(nba_matrix, 
                       Rowv=NA, 
                       Colv=NA, 
                       col = cm.colors(256), 
                       scale="column", 
                       margins=c(5,10))
nba_heatmap <- heatmap(nba_matrix, 
                       Rowv=NA, Colv=NA, 
                       col = heat.colors(256), 
                       scale="column", 
                       margins=c(5,10))

a<- data.frame(alpha=c(6,4,4,9),
               beta=c(2,4,6,8),
               gama=c(0,6,5,3))
a<- as.matrix(a)
hm<- heatmap(a,col = heat.colors(256))

#--------------------------------------------------
# Map Visualization
#--------------------------------------------------
#devtools::install_github("rstudio/leaflet")
library(magrittr)
library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=77.2310, 
             lat=28.6560, 
             popup="The delicious food of chandni chowk")
m  # Print the map

#--------------------------------------------------
# 3D maps
#--------------------------------------------------
# install.packages("Rcmdr")
library(rgl)
library(car)
library(scatter3d)
data(iris, package="datasets")
scatter3d(Petal.Width~Petal.Length+Sepal.Length|Species, 
          data=iris, fit="linear",
          residuals=TRUE, 
          parallel=FALSE, 
          bg="black", 
          axis.scales=TRUE, 
          grid=TRUE, 
          ellipsoid=FALSE)

#--------------------------------------------------
# Correlogram (GUIs)
#--------------------------------------------------
library("corrgram")
cor(iris[1:4])
corrgram(iris)

library("knitr")
opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)
round(cor(baseball[, 5:14], use="pair"),2)

vars2 <- c("Assists","Atbat","Errors","Hits","Homer","logSal",
           "Putouts","RBI","Runs","Walks","Years")
corrgram(baseball[,vars2], order=TRUE,
         main="Baseball data PC2/PC1 order",
         lower.panel=panel.shade, upper.panel=panel.pie,
         diag.panel=panel.minmax, text.panel=panel.txt)

baseball.cor <- cor(baseball[,vars2], use='pair')
baseball.eig <- eigen(baseball.cor)$vectors[,1:2]
e1 <- baseball.eig[,1]
e2 <- baseball.eig[,2]
plot(e1,e2,col='white', xlim=range(e1,e2), ylim=range(e1,e2))
text(e1,e2, rownames(baseball.cor), cex=1)
title("Eigenvector plot of baseball data")
arrows(0, 0, e1, e2, cex=0.5, col="red", length=0.1)

corrgram(baseball[,vars2], main="Baseball data (alphabetic order)")

corrgram(auto, order=TRUE, main="Auto data (PC order)")

corrgram(baseball[,vars2], order=TRUE,
         main="Baseball correlation ellipses",
         panel=panel.ellipse,
         text.panel=panel.txt, diag.panel=panel.minmax)

corrgram(iris,
         main="Iris data with example panel functions",
         lower.panel=panel.pts, upper.panel=panel.conf,
         diag.panel=panel.density)

corrgram(auto, order=TRUE,
         main="Auto data (PC order)",
         lower.panel=corrgram::panel.ellipse,
         upper.panel=panel.bar, diag.panel=panel.minmax,
         col.regions=colorRampPalette(c("darkgoldenrod4", "burlywood1",
                                        "darkkhaki", "darkgreen")))

corrgram(vote, order=TRUE,
         upper.panel=panel.cor, main="vote")
#------------------------------------------------------------------------
# There are three principal GUI packages in R. RCommander with KMggplots, 
# Rattle for data mining and Deducer for Data Visualization. 
# These help to automate many tasks.
# Other graphs may include phylo trees, violon graphs, circular Dendogramsetc.