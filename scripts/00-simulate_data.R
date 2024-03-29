#### Preamble ####
# Purpose: Simulates the dataset that is used for the analysis.
# Author: Geunchul Shin
# Date: January 21 2024
# Contact: joey.shin@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
set.seed(1003380888)

#### Simulate data ####

num_records <- 100

categories <- sample(c("HOLISTIC CENTRE", "RETAIL STORE (FOOD)", 
                       "TAXICAB BROKER", 
                       "PLACE OF AMUSEMENT"), num_records, replace = TRUE)

# Simulating data for the "Num Endorsements" feature
num_endorsements <- sample(1:10, num_records, replace = TRUE)

# Simulating data for the "Issued year" feature
issued_years <- sample(2015:2022, num_records, replace = TRUE)

# Simulating data for the "Issue duration" feature
issue_duration <- runif(num_records, min = 1, max = 60)

# Creating the simulated data-set
simulated_data <- data.frame(
  Category = categories,
  Num_Endorsements = num_endorsements,
  Issued_Year = issued_years,
  Issue_Duration = issue_duration
)

# the simulated dataset
head(simulated_data)

## Data tests

# check if the issued year is in between 2015-2022 (inclusive)
simulated_data |>
  filter(Issued_Year < 2015 | Issued_Year>2022) |>
  count() |>
  sum() == 0

# check if the categorie is not consisted with a single kind
length(unique(simulated_data$Category)) > 1

# check if 'Num_endorsements' is number
is.numeric(simulated_data$Num_Endorsements) == TRUE
  
