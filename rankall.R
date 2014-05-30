rankall <- function(outcome, num = "best") {   
    
    doStuff <- function(state, outcome, num) {   
        ## Check that state and outcome are valid
        if(state %in% dataFrame$state) {
            if(outcome %in% names(dataFrame)) {
                ## Return hospital name in that state with lowest 30-day death rate
                dataFrame <- dataFrame[dataFrame$state == state, ]
                dataFrame <- na.omit(dataFrame[c("hospitalname", outcome)])                
                dataFrame[,2] <- as.numeric(as.character(dataFrame[,2]))                 
                dataFrame <- dataFrame[order(dataFrame[outcome], dataFrame["hospitalname"]), ] 
                
                if(num == "best") num <- 1
                else if(num == "worst") num <- length(dataFrame[,2])
                else num <- num
                
                as.character(dataFrame$hospitalname[as.integer(num)])
            }
            else stop("invalid outcome")
            
        }
        else stop("invalid state")
    }
    
    states <- character()
    hospital <- character()
    
    ## Read outcome data
    dataFrame <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    
    dummyMatrix <- as.matrix(dataFrame)
    dummyMatrix[dummyMatrix=="Not Available"] <- NA
    dataFrame <- as.data.frame(dummyMatrix)    
    names(dataFrame) <- tolower(gsub("[.]", "", names(dataFrame)))
    outcome <- tolower(paste("Hospital30DayDeathMortalityRatesfrom", gsub(" ", "", outcome), sep=""))
    
    ## For each state, find the hospital of the given rank
    for(state in sort(unique(as.character(dataFrame$state)))) {    
        states <- append(states, state)
        hospital <- append(hospital, doStuff(state, outcome, num))
    } 
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    returnDf <- data.frame(hospital=hospital, state=states) 
    rownames(returnDf) <- returnDf$state
    returnDf
}