#########################################################
#### PROBLEMS ###########################################
#########################################################


# BMI = m / h ** 2
# readline()

h <- as.numeric(readline("Enter your height (in cm): "))
w <- as.numeric(readline("Enter your weight (in kg): "))

bmi <- function(){
  h <- as.numeric(readline("Enter your height (in cm): "))
  w <- as.numeric(readline("Enter your weight (in kg): "))
  bm_index <- w / (h / 100) ** 2
  bm_index
}

my_score <- bmi()

round(c(4.5, 6.2, 7,8))
income <- list(c(30, 55, 45), 
               c(40, 25, 30))
income
income * 1000
max(income)

lapply(income, max)
sapply(income, max)

v <- c("www.champ.info/apple ", 
       "www.champ.info/blue_screens ", 
       "www.champ.info/code_monsters ")

strsplit(v, "/")

strsplit(v[2], "/")[[1]][2]
res <- trimws(strsplit(v[2], "/")[[1]][2])
res

unlist(strsplit(res, "_"))

paste(unlist(strsplit(res, "_")), 
      collapse = " ")

toupper()
tolower()

tools::toTitleCase(paste(unlist(strsplit(res, "_")), 
                         collapse = " "))

my_trans <- function(s){
  res <- trimws(strsplit(s, "/")[[1]][2])
  fin <- tools::toTitleCase(paste(unlist(strsplit(res, "_")), 
                                  collapse = " "))
  fin
}

unname(sapply(v, my_trans))

# PART03: R Shiny

install.packages("shiny")
library(shiny)

# Then go to 
# File - New File - Shiny Web App
# Accept all and read the sample file app.R

