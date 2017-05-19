## Extract model results of interest, write TAF output tables

## Before: resultsbyyear, resultsbyyearandage (model)
## After:  summary.csv, natage.csv, fatage.csv (output)

require(icesTAF, quietly=TRUE)

dir.create("output", showWarnings=FALSE)

rby <- read.table("model/resultsbyyear", header=TRUE, check.names=FALSE)
rbya <- read.table("model/resultsbyyearandage", header=TRUE)

## Summary by year
summary <- rby[c("year", "N2", "Cbio3+", "SSB", "obscatch", "F4-7")]
names(summary) <- c("Year", "Rec", "RefB", "SSB", "Landings", "Fbar")
summary$YoverSSB <- summary$Landings / summary$SSB
summary <- summary[c("Year", "Rec", "RefB", "SSB", "Landings", "YoverSSB", "Fbar")]
summary[summary<0] <- NA
summary$RefB <- summary$RefB * 1000
summary$SSB <- summary$SSB * 1000
summary$Landings <- summary$Landings * 1000

## N at age
natage <- xtabs(N~year+age, rbya)
natage <- data.frame(Year=1979:2019, unclass(natage), check.names=FALSE)
row.names(natage) <- NULL

## F at age
fatage <- xtabs(F~year+age, rbya)
fatage <- data.frame(Year=1979:2019, unclass(fatage), check.names=FALSE)
row.names(fatage) <- NULL
fatage[fatage<0] <- NA

## Write tables to output directory
write.taf(summary, "output/summary.csv")
write.taf(natage, "output/natage.csv")
write.taf(fatage, "output/fatage.csv")
