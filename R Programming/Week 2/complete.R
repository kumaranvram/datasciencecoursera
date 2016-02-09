source("helper.R")

complete <- function(directory, id = 1:332) {
        values <- data.frame()
        for (i in id) {
                data <- read_data(directory, i)
                nobs <- nrow(data[complete.cases(data),])
                values <- rbind(values, data.frame(i, nobs))
        }
        values
}