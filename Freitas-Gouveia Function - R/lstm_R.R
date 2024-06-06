# clear all variables
rm(list=ls())
# clear the console
cat("\014")


####################### Load Data

# Define the variables p, q, and i
p <- 3
q <- 0
i <- 10

# Construct the file path dynamically
file_path <- sprintf("TEST/ACF_%d_%d/acf_%d.txt", p, q, i)
lines <- readLines(file_path)
# Convert each line to an integer and store in a list
data_list <- lapply(lines, function(line) as.numeric(line))
acf <- data_list[-1]
# Print the list
acf <- unlist(acf)

# Construct the file path dynamically
file_path <- sprintf("TEST/PACF_%d_%d/pacf_%d.txt", p, q, i)
lines <- readLines(file_path)
# Convert each line to an integer and store in a list
pacf <- lapply(lines, function(line) as.numeric(line))
# Print the list
pacf <- unlist(pacf)


X_test <- array(0, dim = c(1, 2, 10))
X_test[1, 1, ] <- acf
X_test[1, 2, ] <- pacf


######################## Test 
library(reticulate)
library(keras)
# Load the Keras model
new_model <- load_model_tf('lstm_model.keras')
summary(new_model)

# Make predictions on the test data

full_start_time <- Sys.time()
predictions <- new_model$predict(X_test)
full_end_time <- Sys.time()
elapsed_time_seconds <- as.numeric(difftime(full_end_time, full_start_time, units = "secs"))
cat("Full Elapsed time:", elapsed_time_seconds, " (s)\n")

lstm_p = predictions[[1]]
lstm_q = predictions[[2]]

# round to int
lstm_p <- round(lstm_p)
lstm_q <- round(lstm_q)

print(paste("Freitas-Gouveia algorithm returned ARMA(", lstm_p, ",", lstm_q, ")"))