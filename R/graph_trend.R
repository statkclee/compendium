# 0. 환경설정 -----
library(rtweet)  # install.packages("rtweet")
library(tidyverse)
library(glue)

graph_trend <- function(topic) {
  
  tw_dat <- read_rds("data/tw_dat.rds")
  
  ts_data(tw_dat, by="hours") %>% 
    ggplot(aes(x=time, y=n)) +
    geom_line() +
    geom_point() +
    labs(x="", y="트윗횟수", title=paste0("시간별 #", topic, " 트윗 추세")) +
    theme_bw() +
    theme(legend.position = "top")
  
  ggsave("processed/twit_trend.png")
}

# graph_trend("불평등")
