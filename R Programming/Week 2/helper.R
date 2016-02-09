library(stringr)

create_csv_file_paths <- function(directory, file_index) {
        num = str_pad(file_index, 3, side = "left", pad = "0") 
        file_name <- paste(num, "csv", sep = ".")
        file_path <- paste(directory, file_name, sep = "/") 
        file_path
}

read_data <- function(directory, id) {
        file_names <- lapply(id, create_csv_file_paths, directory = directory)
        data <- lapply(file_names, read.csv)
        df <- do.call("rbind", data)
        df
}