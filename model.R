## Run analysis, write model results

## Before: catageysa(.exe), catageysa.dat (ftp, input)
## After:  resultsbyyear, resultsbyyearandage (model)

require(icesTAF, quietly=TRUE)

ftp <- "https://raw.githubusercontent.com/ices-taf/ftp/master/nwwg/2015/had-iceg/"

mkdir("model")

## Get model executable
catageysa <- if(.Platform$OS.type == "unix") "catageysa" else "catageysa.exe"
download.file(paste0(ftp,"/model/",catageysa), paste0("model/",catageysa), quiet=TRUE)
Sys.chmod(paste0("model/", catageysa))

## Get model input file
cp("input/catageysa.dat", "model")

## Run model
setwd("model")
system("catageysa")
