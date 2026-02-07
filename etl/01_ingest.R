library(tidyverse)
library(here)

raw_turnout <- read_tsv(here("data", "raw", "icpsr", "county_turnout_icpsr.tsv"))

glimpse(raw_turnout)

