## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, dls.txt (upload)

mkdir("upload/input")
mkdir("upload/output")

## Input
cp("db/catage.csv", "upload/input")
cp("db/maturity.csv", "upload/input")
cp("db/smb.csv", "upload/input")
cp("db/smh.csv", "upload/input")
cp("db/wcatch.csv", "upload/input")
cp("db/wstock.csv", "upload/input")

## Output
cp("output/fatage.csv", "upload/output")
cp("output/natage.csv", "upload/output")
cp("output/summary.csv", "upload/output")
