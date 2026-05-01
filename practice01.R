#########################################################
#### PRACTICE 01: BAR CHART #############################
#########################################################

# generate data
# sample() pseudo-random sampling

answer01 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.4, 0.5, 0.1))
answer02 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.68, 0.22, 0.1))
answer03 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.35, 0.15))
answer04 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.4, 0.1))

# join as columns and change names
dat <- cbind.data.frame(answer01, answer02, 
                        answer03, answer04)
colnames(dat) <- c("январь 2022", "январь 2023", 
                   "январь 2024", "январь 2025")

# table of frequences
counts <- cbind(table(dat$`январь 2022`),
                table(dat$`январь 2023`),
                table(dat$`январь 2024`),
                table(dat$`январь 2025`))

# change names - take from dat
colnames(counts) <- colnames(dat)
counts

# if counts is 2-dimensional,
# bar plot is stacked by default,
# to unstack, use beside = TRUE

barplot(counts)
barplot(counts, beside = TRUE)

# png() -  to export in png-file
# 9 to 4 inches, dpi is 300

png("Bar01.png", 
    width = 9, height = 4, 
    units = "in",
    res = 300)

# add fill colors (col)
# add edge color (border)
# add labels (xlab and ylab)
# add legend and its style:
# coordinates (x, y),
# orientation (horiz = TRUE)
# font size (cex = 0.6)

barplot(counts, beside = TRUE,
        col = c("navy", "royalblue", "darkgrey"),
        border = "white", 
        xlab = "R хороший?", 
        ylab = "Число ответов",
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           horiz = TRUE,
                           cex = 0.6))
# turn-off the device
# to save changes in png-file
dev.off()

# to find png-file
# get path to the current working directory

getwd()

# and open it from R
utils::browseURL(getwd())
