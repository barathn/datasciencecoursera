complete <- function(directory, id = 1:332) {
      
  files <- list.files( path = directory )[id]
  files <- files[!is.na(files)]
  
  id <- c()
  nobs <- c() 
  
  for(i in 1:length(files)){
    data <- read.csv( paste(directory, "/", files[i], sep="") )
    id = c(id, as.numeric(sub("\\.csv$","",files[i]))  )  
    nobs = c(nobs, nrow(na.omit(data)))
  }
   return (data.frame(id=id, nobs=nobs) )
  
}