## Prepare tables for report

## Before: catage.csv, maturity.csv, smh.csv, wcatch.csv, wstock.csv (data),
##         fatage.csv, natage.csv, summary.csv (output)
## After:  catage.csv, fatage.csv, maturity.csv, natage.csv, smh.csv,
##         summary.csv, wcatch.csv, wstock.csv (report)

library(icesTAF)

mkdir("report")

## catage (plus group)
catage <- read.taf("data/catage.csv")
catage$"10" <- rowSums(catage[as.character(10:14)])
catage <- catage[c("Year", as.character(2:10))]
names(catage)[names(catage)=="10"] <- "10+"
write.taf(catage, "report/catage.csv")

## smh (skip year)
smh <- read.taf("data/smh.csv")
smh <- na.omit(smh)
write.taf(smh, "report/smh.csv")

## wstock (trim year and age)
wstock <- read.taf("data/wstock.csv")
wstock <- head(wstock, -1)[c("Year",as.character(1:10))]
write.taf(wstock, "report/wstock.csv")

## wcatch (trim year and age)
wcatch <- read.taf("data/wcatch.csv")
wcatch <- head(wcatch, -2)[c("Year",as.character(2:10))]
write.taf(wcatch, "report/wcatch.csv")

## maturity (trim year and age)
maturity <- read.taf("data/maturity.csv")
maturity <- head(maturity, -1)[c("Year",as.character(2:10))]
write.taf(maturity, "report/maturity.csv")

## summary (select columns, trim year, insert NA, average, round)
summary <- read.taf("output/summary.csv")
summary$RefB <- summary$HR <- NULL
summary <- head(summary, -4)
summary$Fbar[nrow(summary)] <- NA
avg <- as.data.frame(t(colMeans(head(summary,-1), na.rm=TRUE)))
avg["Year"] <- paste0("Mean79-", summary$Year[nrow(summary)-1])
summary <- rbind(summary, avg)
summary[c("Rec","B3plus","SSB","Landings")] <- round(summary[c("Rec","B3plus","SSB","Landings")])
summary[c("YoverSSB","Fbar")] <- round(summary[c("YoverSSB","Fbar")], 3)
write.taf(summary, "report/summary.csv")

## natage (trim year and age, change units, round)
natage <- read.taf("output/natage.csv")
natage <- head(natage, -2)[c("Year", as.character(1:10))]
natage[-1] <- natage[-1] / 1000
natage[as.character(1:5)] <- round(natage[as.character(1:5)], 1)
natage[as.character(6:10)] <- round(natage[as.character(6:10)], 2)
write.taf(natage, "report/natage.csv")

## fatage (trim year and age)
fatage <- read.taf("output/fatage.csv")
fatage <- head(fatage, -2)[c("Year", as.character(2:10))]
fatage <- round(fatage, 3)
write.taf(fatage, "report/fatage.csv")
