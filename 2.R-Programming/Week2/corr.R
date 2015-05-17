corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  files <- list.files(directory, pattern=".csv", full.names=TRUE)
  corrVector <- numeric()
  
  for (i in 1:length(files)) {
    data <- read.csv(files[i], header=TRUE, colClasses=c("NULL", NA, NA, "NULL"))

    if (sum(complete.cases(data)) > threshold) {
      sulfateComplete <- data[complete.cases(data),1]
      nitrateComplete <- data[complete.cases(data), 2]
      corrVector <- c(corrVector, cor(sulfateComplete, nitrateComplete))
    }
  } 
  return(corrVector)
}
