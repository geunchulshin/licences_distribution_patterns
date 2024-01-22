# An analysis of business licences and permit issued by the Toronto Municipal Licensing and Standards

## Overview of Paper

This paper investigates the issuance of licences by Toronto's Municipal Licensing & Standards to diverse business sectors, focusing on potential biases. The study compares license durations across categories between two intervals (2015-2018 and 2019-2022), highlighting discrepancies in the length of licenses issued in the two periods.

## File Structure

The repository is structured as:

o `input/data` Includes the data sources utilized in the analysis: raw data and cleaned data.

o `outputs/paper` Includes the Quarto document, reference bibliography file and the rendered
PDF.
o `scripts` Includes the R scripts utilized for data simulation, downloading and cleaning.

## How to Run

1. Run `scripts/01-download_data.R` to download raw data
2. Run `scripts/02-data_cleaning.R` to clean data and generate cleaned data
3. Run `outputs/paper/licences_distribution_paper.qmd` to create the PDF version of the paper

##Statement on LLM usage:
There was no LLM usage to write this paper.