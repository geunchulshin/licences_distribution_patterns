#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Geunchul Shin
# Date: January 21 2024
# Contact: joey.shin@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

sel_col_remove <- c("_id", "Licence No.", "Business Phone", 
                    "Plate No.",
                    "Business Phone Ext.", "Licence Address Line 1", 
                    "Licence Address Line 2", "Licence Address Line 3", 
                    "Free Form Conditions Line 1", 
                    "Free Form Conditions Line 2",
                    "Last Record Update")

count_words <- function(text) {
  words <- strsplit(text, ";")[[1]]
  return(length(words))
}

cleaned_data <- raw_data %>% select(-one_of(sel_col_remove)) %>% 
  mutate(Conditions = sub(";$", "", Conditions)) %>% 
  mutate(Endorsements = sub(";$", "", Endorsements)) %>% 
  mutate(Endorsements = sub("x", "", Endorsements)) %>% 
  mutate(Num_Endorsements = sapply(Endorsements, count_words)) %>% 
  mutate(Issued_year = lubridate::year(Issued),
         Issued_month = lubridate::month(Issued, 
                                         label = TRUE, abbr = TRUE)) %>% 
  mutate(Cancel_year = lubridate::year(`Cancel Date`),
         Cancel_month = lubridate::month(`Cancel Date`, 
                                         label = TRUE, abbr = TRUE)) %>% 
  mutate(Issue_duration = as.numeric(difftime(`Cancel Date`, 
                                              Issued, 
                                              units = "days") / 30.44)
)

cleaned_data$Endorsements <- NULL
cleaned_data$`Operating Name` <- NULL
cleaned_data$Issued <- NULL
cleaned_data$`Client Name` <- NULL
cleaned_data$Conditions <- NULL
cleaned_data$`Cancel Date` <- NULL
cleaned_data$`Issued_month` <- NULL
cleaned_data$`Cancel_month` <- NULL
cleaned_data$`Cancel_year` <- NULL

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")
