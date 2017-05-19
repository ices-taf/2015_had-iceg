## Convert data to model format, write model input files

## Before: catageysa.dat (db)
## After:  catageysa.dat (input)

require(icesTAF, quietly=TRUE)

mkdir("input")

## Copy model input file to input directory
cp("db/catageysa.dat", "input")
