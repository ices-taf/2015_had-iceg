## Run analysis, write model results

## Before: catageysa (boot/software), catageysa.dat (boot/data)
## After:  resultsbyyear, resultsbyyearandage (model)

library(icesTAF)

mkdir("model")

## Get model executable
exefile <- if(os.linux()) "catageysa" else "catageysa.exe"
cp(file.path("boot/software/catageysa", exefile), "model")

## Get model input file
cp("boot/data/catageysa.dat", "model")

## Run model
setwd("model")
system("./catageysa")
setwd("..")
