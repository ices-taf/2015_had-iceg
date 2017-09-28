## Convert data to model format, write model input files

## Before: catageysa.dat (data)
## After:  catageysa.dat (input)

library(icesTAF)

mkdir("input")

## Move model input file to input directory
cp("data/catageysa.dat", "input", move=TRUE)
