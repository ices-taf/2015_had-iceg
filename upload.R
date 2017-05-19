## Gather TAF input and output tables to be uploaded

## Before: catage.csv, maturity.csv, smb.csv, smh.csv, wcatch.csv, wstock.csv,
##         fatage.csv, natage.csv, summary.csv (db, output)
## After:  catage.csv, maturity.csv, smb.csv, smh.csv, wcatch.csv, wstock.csv,
##         fatage.csv, natage.csv, summary.csv (upload)

require(icesTAF, quietly=TRUE)

mkdir("upload/input")
mkdir("upload/output")

cp("db/*.csv", "upload/input")
cp("output/*.csv", "upload/output")
