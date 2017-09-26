## Run analysis, write model results

## Before: catageysa, (TAF database), catageysa.dat (input)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

url <- "https://raw.githubusercontent.com/ices-taf/ftp/master/nwwg/2015/had-iceg/model/"

## Get model executable
catageysa <- if(.Platform$OS.type == "unix") "catageysa" else "catageysa.exe"
download(paste0(url,catageysa), "model")

## Get model input file
cp("input/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
