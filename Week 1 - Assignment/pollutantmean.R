pollutantmean <- function(directory, pollutant, id = 1:332) {
  #set the path
  path <- paste(getwd(),"/",directory,"/",sep="")
  
  #get the file List in that directory
  fileList <- list.files(path)
  
  #extract the file names and store as numeric for comparison
  fileNames <- as.numeric(sub("\\.csv$","",fileList))
  
  #select files to be imported based on th?e user input or default
  selectedFiles <- fileList[match(id,fileNames)]
  
  #import data
  Data <- lapply(file.path(path,selectedFiles),read.csv)
  
  #convert into data frame
  Data <- do.call(rbind.data.frame,Data)
  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
}