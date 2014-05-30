# rankall.R

## Introduction.

Download the ﬁle ProgAssignment3-data.zip ﬁle containing the data for Programming Assignment 3 from the Coursera web site. Unzip the ﬁle in a directory that will serve as your working directory. When you start up R make sure to change your working directory to the directory where you unzipped the data.

The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certiﬁed hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be ﬁned for not providing high quality care to patients (see http://goo.gl/jAXFX for some background on this particular topic).

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this assignment. The zip ﬁle for this assignment contains three ﬁles:

* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* hospital-data.csv: Contains information about each hospital.
* Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each ﬁle (i.e the code book).

A description of the variables in each of the ﬁles is in the included PDF ﬁle named Hospital_Revised_Flatfiles.pdf. This document contains information about many other ﬁles that are not included with this programming assignment. You will want to focus on the variables for Number 19 (“Outcome of Care Measures.csv”) and Number 11 (“Hospital Data.csv”). You may ﬁnd it useful to print out this document (at least the pages for Tables 19 and 11) to have next to you while you work on this assignment. In particular, the numbers of the variables for each table indicate column indices in each table (i.e. “Hospital Name” is column 2 in the outcome-of-care-measures.csv ﬁle).

##  Ranking hospitals in all states.

Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv ﬁle and returns a 2-column data frame containing the hospital in each state that has the ranking speciﬁed in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The ﬁrst column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

### Handling ties. 

The rankall function should handle ties in the 30-day mortality rates in the same way that the rankhospital function handles ties.

The function should use the following template.

```
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
```

NOTE: For the purpose of this part of the assignment (and for eﬃciency), your function should NOT call the rankhospital function from the previous section. The function should check the validity of its arguments. If an invalid outcome value is passed to rankall, the function should throw an error via the stop function with the exact message “invalid outcome”. The num variable can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA.

Here is some sample output from the function.

```
> source("rankall.R")
> head(rankall("heart attack", 20), 10)
  hospital                              state
AK <NA>                                 AK
AL D W MCMILLAN MEMORIAL HOSPITAL       AL
AR ARKANSAS METHODIST MEDICAL CENTER    AR
AZ JOHN C LINCOLN DEER VALLEY HOSPITAL  AZ
CA SHERMAN OAKS HOSPITAL                CA
CO SKY RIDGE MEDICAL CENTER             CO
CT MIDSTATE MEDICAL CENTER              CT
DC <NA>                                 DC
DE <NA>                                 DE
FL SOUTH FLORIDA BAPTIST HOSPITAL       FL
```

Save your code for this function to a ﬁle named rankall.R.

Use the submit script provided to submit your solution to this part. There are 3 tests that need to be passed
for this part of the assignment.
