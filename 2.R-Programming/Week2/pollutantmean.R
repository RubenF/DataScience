setwd("C:/Users/Ruben/Desktop/Coursera/2. R Programming/Week 2/Tarea") 

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  
  files <- list.files(directory, pattern=".csv", full.names=TRUE)
  values <- numeric()
  
  for (i in id) {
    data <- read.csv(files[i], header=TRUE)
    values <- c(values, data[[pollutant]])
  }

  meanr <- mean(values, na.rm=TRUE)
  return(round(meanr, 3))
}

#Pruebas
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
