#### Preamble ####
# Purpose: Simulates the dataset that is used for the analysis.
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
set.seed(123)

#### Simulate data ####

num_records <- 100

# Add more categories if needed
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



