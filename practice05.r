#########################################################
#### PART 02 GGPLOT2 ####################################
#########################################################

library(tidyverse)
library(readxl)

# choose file data.xls from Github repo or from here
# https://disk.yandex.ru/d/9pvoLHFKA-BBZg

dat <- read_excel(file.choose())

# simple histogram
ggplot(data = dat, aes(x = X10)) + 
  geom_histogram(fill = "limegreen", 
                 color = "forestgreen", 
                 binwidth = 500)

# tibble object - not a data frame
tib <- dat %>% filter(X10 > 10000) %>% 
  select(REG)
tib[[1]][1]

# add labs and a vertical line,
# change theme

ggplot(data = dat, aes(x = X10)) + 
  geom_histogram(fill = "limegreen", 
                 color = "forestgreen", 
                 binwidth = 500) + 
  theme_bw() +
  labs(title = "Стоимость мин набора продуктов",
       x = "стоимость в октябре 2020",
       y = "количество значений") +
  geom_vline(xintercept = mean(dat$X10), 
             lty = 2, color = "red")

# add labs and a vertical line
ggplot(data = dat, aes(x = X10)) + 
  geom_density(fill = "limegreen", 
               color = "forestgreen") + 
  theme_bw()

# filter three groups
three <- dat %>% 
  filter(OKR %in% c("Центральный федеральный округ", 
                    "Приволжский федеральный округ",
                    "Сибирский федеральный округ"))
View(three)

# histogram by group
ggplot(data = three, aes(x = X10, 
                         group = OKR,
                         fill = OKR)) +
  geom_histogram()

# density plot by group
ggplot(data = three, aes(x = X10, 
                         group = OKR,
                         fill = OKR)) +
  geom_density(alpha = 0.5) 

# split into facets
ggplot(data = three, aes(x = X10, 
                         group = OKR,
                         fill = OKR)) +
  geom_density(alpha = 0.5) + facet_wrap(~OKR)

