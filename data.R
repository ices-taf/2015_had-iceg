# Prepare data, write CSV data tables

# Before: catageysa.dat (boot/data)
# After:  catage.csv, maturity.csv, survey_smb.csv, survey_smh.csv, wcatch.csv,
#         wstock.csv (data)

library(icesTAF)
source("utilities.R")  # extractData

mkdir("data")

# Extract tables
data <- extractData("boot/data/catageysa.dat")

# Write tables to data directory
write.taf(data$catage, dir="data")
write.taf(data$maturity, dir="data")
write.taf(data$survey.smb, dir="data")
write.taf(data$survey.smh, dir="data")
write.taf(data$wcatch, dir="data")
write.taf(data$wstock, dir="data")
