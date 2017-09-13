## Upload raw data to TAF database

## Before: catageysa.dat (user dir)
## After:  catageysa.dat (TAF database)

library(icesTAF)

owd <- setwd("d:/projects/ices-taf/ftp/nwwg/2015/had-iceg/raw")
upload("2015_had-iceg", "raw", "catageysa.dat")
setwd(owd)
