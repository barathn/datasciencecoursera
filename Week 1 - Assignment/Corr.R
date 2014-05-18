corr <- function(directory, threshold = 0) {
  files <- list.files( path = directory )
  
  cr <- c() 
  
  for(i in 1:length(files)){
    data <- read.csv( paste(directory, "/", files[i], sep="") )
    data <- data[complete.cases(data),]
    if ( nrow(data) > threshold ) {
      cr <- c(cr, cor(data$sulfate, data$nitrate) )
    }
  }
  
  return( cr )
}