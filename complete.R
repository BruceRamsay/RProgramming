complete <- function( directory, id = 1:322) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1 117
    ## 2 1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    origdir <- getwd()
    setwd(directory)
    
    ## Create the data frame
    output <- data.frame(id=numeric(0), nobs=numeric(0))
    
    for( i in id ) {
        # Pad the filename and check if file exists
        padfile <- sprintf( "%03d", i )
        filename <- paste( padfile, ".csv", sep="" )
        file.exists(filename)
        
        # Read in the file
        x <- read.csv( filename, header = TRUE )
        y <- sum(complete.cases(x))
        
        output <- rbind( output, data.frame( id = i, nobs = y ))
    }
    
    setwd(origdir)
    output
}