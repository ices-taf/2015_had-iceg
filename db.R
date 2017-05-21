## Download and preprocess data, write TAF input tables

## Before: catageysa.dat (ftp)
## After:  catageysa.dat, catage.csv, wcatch.csv, maturity.csv, wstock.csv,
##         smb.csv, smh.csv (db)

library(icesTAF)
source("utilities.R")

ftp <- "https://raw.githubusercontent.com/ices-taf/ftp/master/nwwg/2015/had-iceg/"

mkdir("db")

## Download data
download.file(paste0(ftp,"db/catageysa.dat"), "db/catageysa.dat", quiet=TRUE)
txt <- readLines("db/catageysa.dat", encoding="latin1")

## Extract tables from original source
db <- extractInput(txt)

## Write tables to db directory
write.taf(db$catage, "db/catage.csv")     # 1.2
write.taf(db$smb, "db/smb.csv")           # 1.3
write.taf(db$smh, "db/smh.csv")           # 1.4
write.taf(db$wstock, "db/wstock.csv")     # 1.5
write.taf(db$wcatch, "db/wcatch.csv")     # 1.6
write.taf(db$maturity, "db/maturity.csv") # 1.7
