# 0. 환경설정 -----
library(rtweet)  # install.packages("rtweet")
library(tidyverse)

args <- commandArgs(trailing=TRUE)

topic <- args[1]
num_twits <- args[2]

get_data <- function(topic, num_twits) {
  
  tw_dat <- search_tweets(q = topic, n = num_twits, include_rts = TRUE, lang = "ko")

  tw_dat %>% 
    write_rds("data/tw_dat.rds")
}

get_data(topic, as.integer(num_twits))

