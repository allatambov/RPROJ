library(tidyverse)

library(car)
library(broom)
library(lmtest)
library(sandwich)
library(ggfortify)
# install.packages(c("ggfortify"))

flats <- read.csv("https://raw.githubusercontent.com/allatambov/RPROJ/refs/heads/main/flats.csv")
View(flats)
