## Prepare tables for report

## Before: catage.csv, smh.csv, wstock.csv, wcatch.csv, maturity.csv,
##         summary.csv, natage.csv, fatage.csv (upload)
## After:  *_rep.csv (upload)

require(icesTAF, quietly=TRUE)

mkdir("upload/report")

## catage (plus group)
catage <- read.taf("upload/input/catage.csv")
catage$"10" <- rowSums(catage[as.character(10:14)])
catage <- catage[c("Year", as.character(2:10))]
names(catage)[names(catage)=="10"] <- "10+"
write.taf(catage, "upload/report/catage_rep.csv")

## smh (skip year)
smh <- read.taf("upload/input/smh.csv")
smh <- na.omit(smh)
write.taf(smh, "upload/input/smh_rep.csv")

## wstock (trim year and age)
wstock <- read.taf("upload/input/wstock.csv")
wstock <- head(wstock, -1)[c("Year",as.character(1:10))]
write.taf(wstock, "upload/report/wstock_rep.csv")

## wcatch (trim year and age)
wcatch <- read.taf("upload/input/wcatch.csv")
wcatch <- head(wcatch, -2)[c("Year",as.character(2:10))]
write.taf(wcatch, "upload/report/wcatch_rep.csv")

## maturity (trim year and age)
maturity <- read.taf("upload/input/maturity.csv")
maturity <- head(maturity, -1)[c("Year",as.character(2:10))]
write.taf(maturity, "upload/report/maturity_rep.csv")

## summary (trim year, insert NA, average, round)
summary <- read.taf("upload/output/summary.csv")
summary <- head(summary, -4)
summary$Fbar[nrow(summary)] <- NA
avg <- as.data.frame(t(colMeans(head(summary,-1), na.rm=TRUE)))
avg["Year"] <- paste0("Mean79-", summary$Year[nrow(summary)-1])
summary <- rbind(summary, avg)
summary[c("Rec","RefB","SSB","Landings")] <- round(summary[c("Rec","RefB","SSB","Landings")])
summary[c("YoverSSB","Fbar")] <- round(summary[c("YoverSSB","Fbar")], 3)
write.taf(summary, "upload/report/summary_rep.csv")

## natage (trim year and age, change units, round)
natage <- read.taf("upload/output/natage.csv")
natage <- head(natage, -2)[c("Year", as.character(1:10))]
natage <- natage / 1000
natage[as.character(1:5)] <- round(natage[as.character(1:5)], 1)
natage[as.character(6:10)] <- round(natage[as.character(6:10)], 2)
write.taf(natage, "upload/report/natage_rep.csv")

## fatage (trim year and age)
fatage <- read.taf("upload/output/fatage.csv")
fatage <- head(fatage, -2)[c("Year", as.character(2:10))]
fatage <- round(fatage, 3)
write.taf(fatage, "upload/report/fatage_rep.csv")
