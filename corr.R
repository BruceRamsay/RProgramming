corr <- function( directory, threshold = 0 ) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a number vector of length 1 indicating the
    ## number of completely observed observations (on all variables)
    ## required to compute the correlation between nitrate and sulfate; the
    ## default is 0
    
    ## Return a number vector of correlations
    
    origdir <- getwd()
    setwd(directory)
    
    output <- numeric(0)
    
    files <- list.files();
    
    for( i in files ) {
        x <- read.csv(i)
        complete <- sum(complete.cases(x))
        
        if( complete > threshold) {
            working <- na.omit(x)
            correlation <- cor(working$nitrate, working$sulfate)
            output <- c( output, correlation)
        }
    }
    
    setwd(origdir)
    output
}