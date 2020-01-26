# 0. 환경설정 -----
library(rtweet)  # install.packages("rtweet")
library(tidyverse)

graph_user_activity <- function() {
  
  tw_dat <- read_rds("data/tw_dat.rds")
  
  top_users <- tw_dat %>% 
    count(screen_name, name="트윗수", sort=TRUE) %>% 
    top_n(5, wt=트윗수) %>% 
    pull(screen_name)
  
  top_users_activity <- lookup_users(top_users) %>% 
    select(screen_name, statuses_count, followers_count, friends_count, favourites_count)
  
  top_users_activity %>% 
    write_rds("data/top_users_activity.rds")
  
  top_users_activity %>% 
    pivot_longer(-screen_name) %>% 
    ggplot(aes(x=screen_name, y=value, fill=screen_name)) +
      geom_col() +
      coord_flip() +
      scale_y_continuous(labels=scales::comma) +
      facet_wrap(~name, scales = "free") +
      labs(x="", y="") +
      theme_bw() +
      theme(legend.position = "none")

  ggsave("processed/user_activity.png")
}

graph_user_activity()
