## Preprocess data, write TAF data tables

## Before: catageysa.dat (TAF database)
## After:  catageysa.dat, catage.csv, wcatch.csv, maturity.csv, wstock.csv,
##         smb.csv, smh.csv (data)

library(icesTAF)
source("utilities.R")

mkdir("data")

url <- "http://taf.ices.local/taf/fs/2015_had-iceg/raw/"

## Download data, this file will later be moved to input
download.file(paste0(url,"catageysa.dat"), "data/catageysa.dat", quiet=TRUE)
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
