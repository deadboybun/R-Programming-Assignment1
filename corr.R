corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  source("complete.R");

  cases <- complete(directory);
  cases <- subset(cases$id, cases$nobs > threshold);

  result <- numeric();
  
  for(id in cases){
    file = paste(directory, "/", formatC(id, width = 3, flag = 0), ".csv", sep="");
    data <- read.csv(file);
    data = data[!is.na(data$sulfate) & !is.na(data$nitrate), ];
    result <- c(result, cor(data$sulfate, data$nitrate));
  }

  result
}