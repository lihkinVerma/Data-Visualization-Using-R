
#--------------------------------------------------
# Histogram
#--------------------------------------------------
library(RColorBrewer)
data(VADeaths)
par(mfrow=c(2,3))
hist(VADeaths,breaks=10, col=brewer.pal(3,"Set3"),main="Set3 3 colors")
hist(VADeaths,breaks=3 ,col=brewer.pal(3,"Paired"),main="Set2 3 colors")
hist(VADeaths,breaks=7, col=brewer.pal(3,"Set1"),main="Set1 3 colors")
hist(VADeaths,breaks= 2, col=brewer.pal(8,"Set3"),main="Set3 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greys"),main="Greys 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greens"),main="Greens 8 colors")

#--------------------------------------------------
# Knowledge of brewer palettes
#--------------------------------------------------
## create a sequential palette for usage and show colors
mypalette<-brewer.pal(7,"Greens")
image(1:7,1,as.matrix(1:7),col=mypalette,xlab="Greens (sequential)",
      ylab="",xaxt="n",yaxt="n",bty="n")

## display a divergent palette
display.brewer.pal(7,"BrBG")
devAskNewPage(ask=TRUE)

## display a qualitative palette
display.brewer.pal(7,"Accent")
devAskNewPage(ask=TRUE)

## display a palettes simultanoeusly
display.brewer.all(n=10, exact.n=FALSE)
devAskNewPage(ask=TRUE)
display.brewer.all(n=10)
devAskNewPage(ask=TRUE)
display.brewer.all()
devAskNewPage(ask=TRUE)
display.brewer.all(type="div")
devAskNewPage(ask=TRUE)
display.brewer.all(type="seq")
devAskNewPage(ask=TRUE)
display.brewer.all(type="qual") 
devAskNewPage(ask=TRUE)
display.brewer.all(n=5,type="div",exact.n=TRUE)
devAskNewPage(ask=TRUE)
display.brewer.all(colorblindFriendly=TRUE)
devAskNewPage(ask=TRUE)
brewer.pal.info
brewer.pal.info["Blues",]
brewer.pal.info["Blues",]$maxcolors


# Make sure to clean your Plots window NOW

#--------------------------------------------------
# Line Chart
#--------------------------------------------------
plot(AirPassengers,type="l")  #Simple Line Plot

#--------------------------------------------------
# Bar Plot
#--------------------------------------------------
barplot(iris$Petal.Length) 
barplot(iris$Sepal.Length,
        col  = brewer.pal(3,"Set1"))
barplot(table(iris$Species,
              iris$Sepal.Length),
        col  = brewer.pal(3,"Set1"))

#--------------------------------------------------
# Box Plot
#--------------------------------------------------
boxplot(iris$Petal.Length~iris$Species)

data(iris)
par(mfrow=c(2,2))
boxplot(iris$Sepal.Length,col="red")
boxplot(iris$Sepal.Length~iris$Species,col="red")
boxplot(iris$Sepal.Length~iris$Species,col=heat.colors(3))
boxplot(iris$Sepal.Length~iris$Species,col=topo.colors(3))

# Make sure to clean your Plots window NOW

#--------------------------------------------------
# Scatter Plot
#--------------------------------------------------
plot(x=iris$Petal.Length)
plot(x=iris$Petal.Length,y=iris$Species)
plot(iris,col=brewer.pal(3,"Set1"))

#--------------------------------------------------
# pie Plot
#--------------------------------------------------
pie(table(iris$Species))

