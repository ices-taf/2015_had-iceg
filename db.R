## Download and preprocess data, write TAF input tables

## Before: catageysa.dat (ftp)
## After:  catageysa.dat, catage.csv, wcatch.csv, maturity.csv, wstock.csv,
##         smb.csv, smh.csv (db)

require(icesTAF, quietly=TRUE)
source("utilities.R")

ftp <- "https://raw.githubusercontent.com/ices-taf/ftp/master/nwwg/2015/had-iceg/"

dir.create("db", showWarnings=FALSE)

## Download data
download.file(paste0(ftp,"db/catageysa.dat"), "db/catageysa.dat", quiet=TRUE)
txt <- readLines("db/catageysa.dat", encoding="latin1")

## Extract tables from original source
db <- extractInput(txt)

## Write tables to local FTP directory
write.taf(db$catage, "db/catage.csv")
write.taf(db$wcatch, "db/wcatch.csv")
write.taf(db$maturity, "db/maturity.csv")
write.taf(db$wstock, "db/wstock.csv")
write.taf(db$smb, "db/smb.csv")
write.taf(db$smh, "db/smh.csv")
