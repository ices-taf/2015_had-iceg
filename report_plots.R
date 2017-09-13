## Prepare plots to demonstrate TAF

## Before: summary.csv (output)
## After:  biomass.png, landings.png, harvest_rate.png, recruitment.png (report)

library(icesTAF)

mkdir("report")

## Trim year, change units
summary <- read.taf("output/summary.csv")
x <- summary[summary$Year<=2016,]
x$Rec <- x$Rec / 1000
x$RefB <- x$RefB / 1000
x$SSB <- x$SSB / 1000
x$Landings <- x$Landings / 1000

## Convenience function
ylim <- function(x, mult=1.05) c(0, mult*max(x))

## Plot functions
plotB <- function()
{
  barplot(rbind(x$SSB, x$RefB-x$SSB), names=x$Year, ylim=ylim(x$RefB),
          ylab="Biomass (kt)",
          main="SSB and reference biomass, showing Blim=Btrigger")
  abline(h=45, lty=2)
  box()
}
plotY <- function()
{
  barplot(x$Landings[x$Year<=2014], names=x$Year[x$Year<=2014],
          ylim=ylim(x$Landings[x$Year<=2014]), ylab="Landings (kt)",
          main="Landings, showing the average")
  abline(h=mean(x$Landings[x$Year<=2014]), lty=2)
  box()
}
plotHR <- function()
{
  plot(YoverSSB~Year, x, subset=Year<=2014, type="l", lwd=2,
       ylim=ylim(x$YoverSSB[x$Year<=2014]), yaxs="i", ylab="Harvest rate",
       main="Harvest rate, showing target (HRmgt)")
  abline(h=c(0.40), lty=2)
}
plotR <- function()
{
  barplot(x$Rec, names=x$Year, ylim=ylim(x$Rec),
          ylab="Number of 2-year-olds (millions)",
          main="Recruitment, showing the average")
  abline(h=mean(x$Rec), lty=2)
  box()
}

## Export
png("report/biomass.png", width=1200, height=1200, pointsize=24)
plotB()
invisible(dev.off())

png("report/landings.png", width=1200, height=1200, pointsize=24)
plotY()
invisible(dev.off())

png("report/harvest_rate.png", width=1200, height=1200, pointsize=24)
plotHR()
invisible(dev.off())

png("report/recruitment.png", width=1200, height=1200, pointsize=24)
plotR()
invisible(dev.off())
