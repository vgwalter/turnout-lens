library(readr)
library(dplyr)
library(stringr)
library(here)


staged_turnout <- readRDS(here("data", "processed", "staged_turnout.rds"))

county_turnout <- staged_turnout %>%
  filter(!is.na(BALLOTS_CAST), !is.na(CVAP), CVAP > 0) %>%
  rename(
    county_fips = STCOFIPS10,
    year = YEAR,
    ballots_cast = BALLOTS_CAST,
    cvap = CVAP
  )
  mutate(
    turnout_rate = ballots_cast / cvap,
    state_fips = substr(STCOFIPS10, 1, 2)
  ) %>%
  select(
    county_fips,
    state_fips,
    year,
    ballots_cast,
    cvap,
    turnout_rate
  )

saveRDS(county_turnout, here("data", "processed", "county_turnout.rds"))
