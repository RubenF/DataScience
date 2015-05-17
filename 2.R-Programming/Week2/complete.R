complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- list.files(directory, pattern=".csv", full.names=TRUE)
  idRow <- numeric()
  nobsRow <- numeric()

  for (i in id) {
    data <- read.csv(files[i], header=TRUE)
    idRow <- c(idRow, i)
    nobsRow <- c(nobsRow, sum(complete.cases(data)))
  }
  
  dataFrame <- data.frame(id = idRow, nobs = nobsRow)
  return (dataFrame)
}
