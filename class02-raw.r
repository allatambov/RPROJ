####################
### for matrix M ###
####################

M <- matrix(10:21, nrow = 4)
rownames(M) <- month.abb[1:4]
colnames(M) <- c("Nif-Nif", 
                 "Naf-Naf", 
                 "Nuf-Nuf")
M

#####################
### for bar chart ###
#####################

answer01 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.4, 0.5, 0.1))
answer02 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.68, 0.22, 0.1))
answer03 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.35, 0.15))
answer04 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.4, 0.1))
dat <- cbind.data.frame(answer01, answer02, 
                        answer03, answer04)
colnames(dat) <- c("январь 2022", "январь 2023", 
                   "январь 2024", "январь 2025")
counts <- cbind(table(dat$`январь 2022`),
                table(dat$`январь 2023`),
                table(dat$`январь 2024`),
                table(dat$`январь 2025`))
colnames(counts) <- colnames(dat)
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


