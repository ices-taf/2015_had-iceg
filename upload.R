## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, dls.txt (upload)

mkdir("upload/input")
mkdir("upload/output")

## Input
cp("db/catage.csv", "upload/input/catage.csv")
cp("db/maturity.csv", "upload/input/maturity.csv")
cp("db/smb.csv", "upload/input/smb.csv")
cp("db/smh.csv", "upload/input/smh.csv")
cp("db/wcatch.csv", "upload/input/wcatch.csv")
cp("db/wstock.csv", "upload/input/wstock.csv")

## Output
cp("output/fatage.csv", "upload/output/fatage.csv")
cp("output/natage.csv", "upload/output/natage.csv")
cp("output/summary.csv", "upload/output/summary.csv")
