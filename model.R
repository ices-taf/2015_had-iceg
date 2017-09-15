## Run analysis, write model results

## Before: catageysa(.exe), catageysa.dat (TAF database, input)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

url <- "http://taf.ices.local/taf/fs/2015_had-iceg/model/"

## Get model executable
catageysa <- if(.Platform$OS.type == "unix") "catageysa" else "catageysa.exe"
download(paste0(url,catageysa), "model")

## Get model input file
cp("input/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
