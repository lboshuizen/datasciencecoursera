# Analysis of Human Activity Recognition Using Smartphones Dataset

Analysis of the dataset downloaded from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Available scripts:

1. [run_analysis.R](./run_analysis.R1)<br />
   _transforms the orginal dataset. Produces 2 .csv files:_<br />
   - analysis.csv
   - summary.csv

## Datafiles

2 datafiles resulting from the above script, stored in `./data`:

**analysis.csv**: 67 of the orginal 561 with 'improved' varable names

**summary.csv**: mean of every column in analysis.csv, grouped by subject & activity.

_note: the original datafiles are also retained in `./data` for reference_

## Codebook

Additional details are described in [Codebook.md](./Codebook.md)
