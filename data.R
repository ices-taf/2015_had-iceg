## Preprocess data, write TAF data tables

## Before: catageysa.dat (bootstrap/data)
## After:  catage.csv, maturity.csv, survey_smb.csv, survey_smh.csv, wcatch.csv,
##         wstock.csv (data)

library(icesTAF)
source("utilities.R")

mkdir("data")

## Read data
txt <- readLines("bootstrap/data/catageysa.dat")

## Extract tables
data <- extractInput(txt)

## Write tables to data directory
setwd("data")
write.taf(data$catage, "catage.csv")      # 1.2
write.taf(data$smb, "survey_smb.csv")     # 1.3
write.taf(data$smh, "survey_smh.csv")     # 1.4
write.taf(data$wstock, "wstock.csv")      # 1.5
write.taf(data$wcatch, "wcatch.csv")      # 1.6
write.taf(data$maturity, "maturity.csv")  # 1.7
setwd("..")
