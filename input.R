## Convert data to model format, write model input file

## Before: catageysa.dat (db)
## After:  catageysa.dat (input)

dir.create("input", showWarnings=FALSE)

## Copy model input file to input directory
invisible(file.copy("db/catageysa.dat", "input/catageysa.dat", overwrite=TRUE))
