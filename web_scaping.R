library(Rcrawler)
library(foreach)

# Probably won't work for sites that need API
Rcrawler(Website = "https://www.dailyupdates.co.ke", 
    no_cores = 4, no_conn = 4, KeywordsFilter = c("missing"), 
    RequestsDelay = 3)
