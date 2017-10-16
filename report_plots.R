## Prepare plots to demonstrate TAF

## Before: summary.csv (output)
## After:  biomass.png, harvest_rate.png, landings.png, recruitment.png (report)

library(icesTAF)

mkdir("report")

## Trim year, change units
summary <- read.taf("output/summary.csv")
x <- summary[summary$Year<=2016,]
x <- div(x, c("Rec","B3plus","SSB","RefB","Landings"))

## Plots
tafpng("biomass")
plot(SSB~Year, x, type="l", lwd=2, ylim=lim(x$SSB), yaxs="i",
     ylab="SSB (1000 t)", main="Spawning stock biomass")
abline(h=45, lwd=3, col=taf.orange)
abline(h=45, lwd=3, lty=2)
legend("topleft", c("Btrigger","Blim"), lwd=3, lty=1:2,
       col=c(taf.orange,"black"), bty="n")
dev.off()

tafpng("harvest_rate")
plot(HR~Year, x, subset=Year<=2014, type="l", lwd=2, ylim=lim(x$HR),
     yaxs="i", ylab="Harvest rate", main="Harvest rate")
abline(h=c(0.40), lty=2, lwd=3)
legend("bottomleft", "HRtarget", lty=2, lwd=3, bty="n")
dev.off()

tafpng("landings")
barplot(x$Landings[x$Year<=2014], names=x$Year[x$Year<=2014], col=taf.green,
        ylim=lim(x$Landings), ylab="Landings (1000 t)", main="Landings")
box()
dev.off()

tafpng("recruitment")
barplot(x$Rec, names=x$Year, ylim=lim(x$Rec), col=taf.dark,
        ylab="Recruitment (millions)", main="Recruitment (age 2)")
box()
dev.off()
