## Prepare plots to demonstrate TAF

## Before: summary.csv (output)
## After:  biomass.png, harvest_rate.png, landings.png, recruitment.png (report)

library(icesTAF)

mkdir("report")

## Trim year, change units
summary <- read.taf("output/summary.csv")
x <- summary[summary$Year<=2016,]
x$Rec <- x$Rec / 1000
x$B3plus <- x$B3plus / 1000
x$SSB <- x$SSB / 1000
x$RefB <- x$RefB / 1000
x$Landings <- x$Landings / 1000

tafpng("biomass")
plot(SSB~Year, x, type="l", lwd=2, ylim=lim(x$SSB), yaxs="i",
     ylab="SSB (1000 t)", main="Spawning stock biomass")
abline(h=45, lwd=3, col="orange")
abline(h=45, lwd=2, lty=2)
legend("topleft", c("Btrigger","Blim"), lwd=3:2, lty=1:2,
       col=c("orange","black"), bty="n")
ido()

tafpng("harvest_rate")
plot(HR~Year, x, subset=Year<=2014, type="l", lwd=2, ylim=lim(x$HR),
     yaxs="i", ylab="Harvest rate", main="Harvest rate")
abline(h=c(0.40), lty=2, lwd=2)
legend("bottomleft", "HRtarget", lty=2, lwd=2, bty="n")
ido()

tafpng("landings")
barplot(x$Landings[x$Year<=2014], names=x$Year[x$Year<=2014], col="#8bc2b6",
        ylim=lim(x$Landings), ylab="Landings (1000 t)", main="Landings")
box()
ido()

tafpng("recruitment")
barplot(x$Rec, names=x$Year, ylim=lim(x$Rec), col="#424242",
        ylab="Recruitment (millions)", main="Recruitment (age 2)")
box()
ido()
