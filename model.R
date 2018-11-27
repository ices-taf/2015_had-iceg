## Run analysis, write model results

## Before: catageysa (bootstrap/software), catageysa.dat (bootstrap/data)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

## Get model executable
exefile <- if(os.unix()) "catageysa" else "catageysa.exe"
taf.unzip("bootstrap/software/catageysa.zip", files=exefile, exdir="model")

## Get model input file
cp("bootstrap/data/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
