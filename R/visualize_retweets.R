# 0. 환경설정 -----
library(rtweet)  # install.packages("rtweet")
library(tidyverse)
library(igraph)

visualize_retweets <- function() {
  
  tw_dat <- read_rds("data/tw_dat.rds")
  
  cc_twts_edgelist <- tw_dat %>% 
    select(screen_name, retweet_screen_name, followers_count) %>% 
    filter(complete.cases(.))
  
  cc_twts_nw <- graph_from_data_frame(cc_twts_edgelist, directed = TRUE)
  
  png(filename="processed/retweet_network.png")
  
  plot(cc_twts_nw,
       asp = 9/16,
       vertex.size = 5,
       vertex.color = "skyblue",
       edge.arrow.size = 0.1,
       edge.color = "darkgray",
       vertex.label.cex = 0.7,
       vertex.label.color = "black")  

  dev.off()
}

visualize_retweets()
