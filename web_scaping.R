library(Rcrawler)
library(foreach)
Rcrawler(Website = "https://www.twitter.com", 
    no_cores = 4, no_conn = 4, KeywordsFilter = c("missing person"), 
    RequestsDelay = 3)
