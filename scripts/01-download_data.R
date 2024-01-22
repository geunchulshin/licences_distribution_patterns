#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Geunchul Shin
# Date: January 21 2024
# Contact: joey.shin@mail.utoronto.ca
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

resources <- list_package_resources("57b2285f-4f80-45fb-ae3e-41a02c3a137f")

#### Download data ####

# get all resources for this package

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
the_raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
