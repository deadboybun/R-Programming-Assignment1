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
  df <- data.frame(id = integer(length(id)), nobs = integer(length(id)), stringsAsFactors = FALSE)

  for(i in 1:length(id)){
    file <- paste(directory, "/", formatC(id[i], width = 3, flag = 0), ".csv", sep="");
    data <- read.csv(file);
    data <- data[!is.na(data$sulfate) & !is.na(data$nitrate), ];
    df$id[i] <- id[i];
    df$nobs[i] <- nrow(data);
  }
  
  df
}