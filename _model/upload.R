## Upload model executables to TAF database

## Before: catageysa, catageysa.exe (user dir)
## After:  catageysa, catageysa.exe (TAF database)

library(icesTAF)

owd <- setwd("d:/projects/ices-taf/ftp/nwwg/2015/had-iceg/model")
upload("2015_had-iceg", "model", "catageysa.exe")
upload("2015_had-iceg", "model", "catageysa")
setwd(owd)
