# 0. 환경설정 -----
# Sys.setenv(R_USER = "C:/Users/statkclee")
library(rtweet)  # install.packages("rtweet")
library(tidyverse)

args <- commandArgs(TRUE)

get_data <- function(topic=args[1], num_twits=args[2]) {
  
  tw_dat <- search_tweets(topic, n = num_twits, include_rts = TRUE, lang = "ko")

  tw_dat %>% 
    write_rds("data/tw_dat.rds")
}

# get_data('불평등', 100)
