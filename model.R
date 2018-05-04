## Run analysis, write model results

## Before: catageysa (begin/model), catageysa.dat (input)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

## Get model executable
catageysa <- if(.Platform$OS.type == "unix") "catageysa" else "catageysa.exe"
cp(paste0("begin/model/",catageysa), "model")

## Get model input file
cp("input/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
