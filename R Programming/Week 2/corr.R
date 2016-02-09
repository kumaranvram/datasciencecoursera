source("complete.R")

corr <- function(directory, threshold = 0) {
        
        #data <- read_data(directory, id)
        all_cases <- complete(directory)
        valid_cases <- all_cases[all_cases$nobs > threshold, 1]
        all_files <- list.files(path = directory, full.names = TRUE)
        correlation <- rep(NA,length(valid_cases))
        for (i in valid_cases) {
                data <- read.csv(all_files[i])
                complete_cases <- complete.cases(data)
                sulfate_data <- data[complete_cases, 2]
                nitrate_data <- data[complete_cases, 3]
                correlation[i] <- cor(x = sulfate_data, y = nitrate_data)
        }
        correlation <- correlation[complete.cases(correlation)]
        correlation
}