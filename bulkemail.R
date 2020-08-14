# Install email rep
install.packages("emailrep", repos = "https://cinc.rud.is")

# load emailrep
library(emailrep)

## Check the validity of emails
email_rep("tim@apple.com")
email_rep("alfylev@gmail.com")
email_rep("reginasmith2424@gmail.com")
email_rep(c("aggiemaida@gmail.com", 
    "chevviesq@gmail.com"))

## Multiple IDs
email_ids <- c("info@jabberbomb.com", 
    "bensonjoyce39@gmail.com", "channing@indiehackers.com")

# use purrr for a bit of functional programming (with map())
library(purrr)
library(magrittr)
result_df <- map(email_ids, email_rep) %>% 
    map_df(., magrittr::extract, c("email", 
        "reputation", "suspicious"))

library(parallel)
# Use the detectCores() function to find the number of cores in system
no_cores <- detectCores()
# Setup cluster
clust <- makeCluster(no_cores) #This line will take time

#The parallel version of lapply() is parLapply() and 
#needs an additional cluster argument.
parLapply(clust,1:5, function(x) c(x^2,x^3))
stopCluster(clust)

library(doParallel)
registerDoParallel(makeCluster(no_cores))

