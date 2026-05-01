#########################################################
#### PRACTICE 02: BAR CHART CTD #########################
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
colnames(counts) <- colnames(dat)

# if counts is 2-dimensional,
# bar plot is stacked by default,
# to unstack, use beside = TRUE

bar <- barplot(counts, 
               beside = TRUE, 
               col = c("navy", "royalblue", "darkgrey"), 
               border = "white",
               xlab = "R хороший?", 
               ylab = "Число ответов", 
               font.lab = 1,
               font.axis = 2,
               legend = rownames(counts),
               args.legend = list(x = 15, 
                                  y = 178,
                                  cex = 0.6, 
                                  horiz = TRUE))
bar

# prepare coordinates of labels
xpos <- as.vector(bar)
ypos <- as.vector(counts)
xpos
ypos

# example labels, 
# 12 letters just to check
labels <- LETTERS[1:12]

# look at text() after barplot(),
# it adds labels with coordinates from xpos, ypos

barplot(counts, 
        beside = TRUE, 
        col = c("navy", "royalblue", "darkgrey"), 
        border = "white",
        xlab = "R хороший?", 
        ylab = "Число ответов", 
        font.lab = 1,
        font.axis = 2,
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           cex = 0.6, 
                           horiz = TRUE))
text(labels, x = xpos, 
     y = ypos, cex = 0.6)

# now we create proper labels with percentages
count_perc <- apply(counts, 2, 
                    function(x){x / sum(x) * 100})
perc <- round(as.vector(count_perc))
labels <- paste(perc, "%", sep = "")
labels

png("Barplot02.png", units = "in", width = 9, 
    height = 4, res = 300)
barplot(counts, 
        beside = TRUE, 
        col = c("navy", "royalblue", "darkgrey"), 
        border = "white",
        xlab = "R хороший?", 
        ylab = "Число ответов", 
        font.lab = 1,
        font.axis = 2,
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           cex = 0.6, 
                           horiz = TRUE))
text(labels, x = xpos, 
     y = ypos + 5, cex = 0.6, font = 2)

dev.off()

utils::browseURL(getwd())

# now we change label colors,
# repeated names of colors
my.colors <- rep(c("white", 
                   "black", "black"), 4)
my.colors

png("Barplot03.png", units = "in", width = 9, 
    height = 4, res = 300)
barplot(counts, 
        beside = TRUE, 
        col = c("navy", "royalblue", "darkgrey"), 
        border = "white",
        xlab = "R хороший?", 
        ylab = "Число ответов", 
        font.lab = 1,
        font.axis = 2,
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           cex = 0.6, 
                           horiz = TRUE))
text(labels, x = xpos, 
     y = ypos - 5, cex = 0.6, font = 2,
     col = my.colors)

dev.off()
