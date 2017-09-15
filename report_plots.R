## Prepare plots to demonstrate TAF

## Before: summary.csv (output)
## After:  biomass.png, landings.png, harvest_rate.png, recruitment.png (report)

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

## Convenience function
ylim <- function(x, mult=1.05) c(0, mult*max(x, na.rm=TRUE))

## Plot functions
plotY <- function()
{
  barplot(x$Landings[x$Year<=2014], names=x$Year[x$Year<=2014], col="#8bc2b6",
          ylim=ylim(x$Landings), ylab="Landings (1000 t)", main="Landings")
  box()
}
plotR <- function()
{
  barplot(x$Rec, names=x$Year, ylim=ylim(x$Rec), col="#424242",
          ylab="Recruitment (millions)", main="Recruitment (age 2)")
  box()
}
plotHR <- function()
{
  plot(HR~Year, x, subset=Year<=2014, type="l", lwd=2, ylim=ylim(x$HR),
       yaxs="i", ylab="Harvest rate", main="Harvest rate")
  abline(h=c(0.40), lty=2, lwd=2)
  legend("bottomleft", "HRtarget", lty=2, lwd=2, bty="n")
}
plotB <- function()
{
  plot(SSB~Year, x, type="l", lwd=2, ylim=ylim(x$SSB), yaxs="i",
       ylab="SSB (1000 t)", main="Spawning stock biomass")
  abline(h=45, lwd=3, col="orange")
  abline(h=45, lwd=2, lty=2)
  legend("topleft", c("Btrigger","Blim"), lwd=3:2, lty=1:2,
         col=c("orange","black"), bty="n")
}

## Export
w <- 800
h <- 600
pt <- 24

png("report/biomass.png", width=w, height=h, pointsize=pt)
plotB()
invisible(dev.off())

png("report/landings.png", width=w, height=h, pointsize=pt)
plotY()
invisible(dev.off())

png("report/harvest_rate.png", width=w, height=h, pointsize=pt)
plotHR()
invisible(dev.off())

png("report/recruitment.png", width=w, height=h, pointsize=pt)
plotR()
invisible(dev.off())
