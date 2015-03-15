pollutantmean <- function(directory, pollutant, id =1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate"
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    origdir <- getwd()
    setwd(directory)
    
    ## Create an empty mean (we need it to have zero value so we can mean means)
    mean <- numeric(0)
    
    ## for for each of the values in id
    
    mean <- NULL
    x <- NULL
    
    for( i in id ) {   
        ## Pad the filename and check if file exists
        padfile <- sprintf("%03d",i)
        filename <- paste(padfile,".csv",sep="")
        file.exists(filename)
        
        ## Read in the file
        x <- rbind(x, read.csv( filename, header = TRUE ))
    }
    mean <- mean(x[[pollutant]], na.rm = TRUE)
    
    setwd(origdir)
    round( mean, 3 )
}