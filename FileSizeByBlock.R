FileSizeByBlock <- function(file, blocksize = 512) {
    # Take input file from caller, this contains a list with two columns, the 
    # first is the size of the file in bytes the second is the filename
    
    file.exists(file)
    results <- array(data = 0, dim=c(200,2))
    x <- read.csv( file, header = FALSE, stringsAsFactors = FALSE )
    x$V1 <- as.numeric(x$V1)
    for( i in 1:nrow(x) ) {
        sectorsize <- x[i,1] %/% 512
        
        if( sectorsize < 200 ) {
            results[sectorsize+1,1] <- sectorsize 
            results[sectorsize+1,2] <- results[sectorsize+1,2] + 1
        }
    }
    
    #Remove any counts which are zero
    sub <- apply( results, 1, function(row) row[2] != 0)
    results <- results[sub,]
    
    for( i in 1:nrow(results) ) {
        # Go through and calculate wasted sectors based on 4 KiB blocks
        
    }
    results
}