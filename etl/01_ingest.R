library(readr)
library(here)

staged_turnout <- read_tsv(
  here("data", "raw", "icpsr", "county_turnout_icpsr.tsv")
)

saveRDS(staged_turnout, here("data", "processed", "staged_turnout.rds"))


