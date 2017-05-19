## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, dls.txt (upload)

dir.create("upload/input", showWarnings=FALSE, recursive=TRUE)
dir.create("upload/output", showWarnings=FALSE)

## Input
invisible(file.copy("db/catage.csv", "upload/input/catage.csv", overwrite=TRUE))
invisible(file.copy("db/maturity.csv", "upload/input/maturity.csv", overwrite=TRUE))
invisible(file.copy("db/smb.csv", "upload/input/smb.csv", overwrite=TRUE))
invisible(file.copy("db/smh.csv", "upload/input/smh.csv", overwrite=TRUE))
invisible(file.copy("db/wcatch.csv", "upload/input/wcatch.csv", overwrite=TRUE))
invisible(file.copy("db/wstock.csv", "upload/input/wstock.csv", overwrite=TRUE))

## Output
invisible(file.copy("output/fatage.csv", "upload/output/fatage.csv", overwrite=TRUE))
invisible(file.copy("output/natage.csv", "upload/output/natage.csv", overwrite=TRUE))
invisible(file.copy("output/summary.csv", "upload/output/summary.csv", overwrite=TRUE))
