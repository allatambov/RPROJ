#########################################################
#### PART 00 PREPARE ####################################
#########################################################

library(tidyverse)

# check whether libraries are installed,
# if not, uncomment install.packages()
# and put names inside

library(car)
library(broom)
library(lmtest)
library(sandwich)
library(ggfortify)
# install.packages(c("car", "ggfortify"))

# load data

flats <- read.csv("https://raw.githubusercontent.com/allatambov/RPROJ/refs/heads/main/flats.csv")
View(flats)

#########################################################
#### PART 01 TWO SAMPLE TESTS ###########################
#########################################################

# Student t-test for 2 independent samples
t.test(flats$price ~ flats$walk)
t.test(price ~ walk, data = flats)

# look at structure
# and select elements
res <- t.test(flats$price ~ flats$walk)
str(res)

res$statistic
class(res$statistic)
res$conf.int
res$conf.int[1]
res$conf.int[2]

# with dplyr syntax (pipe %>%)
flats %>% t.test(price ~ walk, data = .)

# checks for normality
# Shapiro-Wilk test
shapiro.test(flats$price)

# check normality by group
# without filtering

flats %>% group_by(walk) %>% 
  summarise(shapiro.test(price)$p.value)

# Wilcoxon rank sum for 2 independent samples
wilcox.test(flats$price ~ flats$walk)
flats %>% wilcox.test(price ~ walk, data = .)

#########################################################
#### PART 02 MULTIPLE SAMPLE TESTS ######################
#########################################################

# forcats library from tidyverse
# add a categorical variable
# by splitting observations into 
# 3 groups based on metrdist

cut_number(flats$metrdist, n = 3)
ntile(flats$metrdist, n = 3)

flats <- flats %>% 
  mutate(metro = ntile(flats$metrdist, n = 3))

flats %>% group_by(metro) %>% 
  summarise(n = n(), 
            pvalue = shapiro.test(price)$p.value)

# ANOVA
summary(aov(flats$price ~ flats$metro))

# Kruskal-Wallis test
kruskal.test(flats$price ~ flats$metro)

