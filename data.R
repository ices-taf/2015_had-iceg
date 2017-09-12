## Download and preprocess data, write TAF input tables

## Before: catageysa.dat (ftp)
## After:  catageysa.dat, catage.csv, wcatch.csv, maturity.csv, wstock.csv,
##         smb.csv, smh.csv (data)

library(icesTAF)
source("utilities.R")

ftp <- "https://raw.githubusercontent.com/ices-taf/ftp/master/nwwg/2015/had-iceg/"

mkdir("data")

## Download data
download.file(paste0(ftp,"raw/catageysa.dat"), "data/catageysa.dat", quiet=TRUE)
txt <- readLines("data/catageysa.dat", encoding="latin1")

## Extract tables from original source
data <- extractInput(txt)

## Write tables to data directory
write.taf(data$catage, "data/catage.csv")     # 1.2
write.taf(data$smb, "data/smb.csv")           # 1.3
write.taf(data$smh, "data/smh.csv")           # 1.4
write.taf(data$wstock, "data/wstock.csv")     # 1.5
write.taf(data$wcatch, "data/wcatch.csv")     # 1.6
write.taf(data$maturity, "data/maturity.csv") # 1.7
