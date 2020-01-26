# 0. 환경설정 -----
library(rtweet)  # install.packages("rtweet")
library(tidyverse)
library(tidytext)
library(extrafont)
loadfonts()


visualize_nlp <- function(topic) {
  
  tw_dat <- read_rds("data/tw_dat.rds")
  
  count_df <- tw_dat %>% 
    select(status_id, text) %>% 
    unnest_tokens(word, text) %>% 
    anti_join(stop_words, by = "word") %>%
    count(word, sort = TRUE) %>% 
    top_n(15, wt=n)
  
  
  count_df %>% 
    ggplot(aes(x=fct_reorder(word, n), y=n)) +
    geom_col() +
    coord_flip() +
    labs(x="", y="") +
    scale_y_continuous(labels = scales::comma) +
    theme_bw(base_family = "NanumGothic")
    
  ggsave("processed/bow_nlp.png")
}

visualize_nlp()
