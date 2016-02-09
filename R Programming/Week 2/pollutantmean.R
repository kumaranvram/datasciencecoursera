source("helper.r")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        data <- read_data(directory, id)
        mean(data[[pollutant]], na.rm =TRUE)
}

