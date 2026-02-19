# vectors
v1 <- c(3, 6, 8, 9)
v1
v2 <- c(3, 6.6, 8, 9)
v2
v3 <- c("2,5", "3", 8, 9)
v3

class(v1); typeof(v1)
class(v2); typeof(v2)
class(v3); typeof(v3)

v4 <- as.integer(v1)
v4
class(v4); typeof(v4)

v5 <- as.character(v1)
v5

# choosing elements
long <- c(1, 9, 8, 4, 1, 9, 8, 5)
length(long)
long[1]
long[2:4]
long[2:]
long[2:length(long)]
long[2:9]
long[2:10]

long[-1]
long[-2]
long[-2:length(long)]
long[-2:0]
long[-2:-4]

long[c(2, 5, 8)]
long[c(2, 5:8)]
long[c(2, 5, 1:6)]

# merging vectors
c(3, 7, 8) + c(1, 2, 0)
c(3, 7, 8) + c(1, 2)
c(c(3, 7, 8), c(1, 2))

# sequences
1:10
25:40
seq(1, 20, 2)
seq(1, 20, length.out = 10)
labs <- c("A", "B", "C", "D")
seq(1, 20, along.with = labs)

rep("A", 3)
rep(NA, 10)
rep(c("red", "blue"), 4)
rep(c("red", "blue"), each = 4)

# prepared vectors
letters
LETTERS
month.name
month.abb
colors()

# dates
ISOdate(2023, 1:12, 1)
ISOdate(2023, 1:12, 2)
ISOdate(2023, 1:12, 31)

format(ISOdate(2023, 1:12, 1), "%D")
format(ISOdate(2023, 1:12, 1), "%d %B %Y")
format(ISOdate(2023, 1:12, 1), "%d %B %y")
format(ISOdate(2023, 1:12, 1), "%d %b %y")
format(ISOdate(2023, 1:12, 1), "%d %B %y")
format(ISOdate(2023, 1:12, 1), "%d %B %Y (%A)")
format(ISOdate(2023, 1:12, 1), "%d %B %Y (%a)")
format(ISOdate(2023, 1:12, 1), "%d %B %Y %H:%M:%S")

# combing text and numbers
paste("группа", 221:224)
paste("группа", 221:224, sep = "-")
parts <- c("01", "03", "2023")
paste(parts, sep = "/")
paste(parts, collapse = "/")

# matrices
M <- matrix(10:21, nrow = 4)
M
rownames(M) <- month.abb[1:4]
colnames(M) <- c("Nif-Nif", "Naf-Naf", "Nuf-Nuf")
M

M[1, 3]
M[3, 1]
M[c(2, 4), 3]
M[1, 2:3]

colSums(M)
rowSums(M)
colMeans(M)
rowMeans(M)

apply(M, 1, sum)
apply(M, 2, sum)
apply(M, 2, min)
apply(M, 1, function(x){x / sum(x) * 100})
apply(M, 2, function(x){x / sum(x) * 100})

cbind()
rbind()

cbind.data.frame()
rbind.data.frame()

# lists
pairs <- list("Да" = "yes", "Нет" = "no", "Нет ответа" = NA)
pairs
pairs$Да
pairs$`Нет ответа`
pairs[1]
pairs[1:2]
pairs[[1]]
pairs[1:2]

L <- list(names = c("Elaine", "Cassandra", "Harry"), 
          marks = c(6, 8, 9))
L
L$names
L$marks
L$names[1]

# practice 1
answer01 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.4, 0.5, 0.1))
answer02 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.68, 0.22, 0.1))
answer03 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.35, 0.15))
answer04 <- sample(c("Да", "Нет", "Нет ответа"), 200, 
                   replace = TRUE, prob = c(0.5, 0.4, 0.1))

dat <- cbind.data.frame(answer01, answer02, answer03, answer04)
colnames(dat) <- c("январь 2020", "январь 2021", 
                   "январь 2022", "январь 2023")

counts <- cbind(table(dat$`январь 2020`), 
                table(dat$`январь 2021`),
                table(dat$`январь 2022`), 
                table(dat$`январь 2023`))

colnames(counts) <- colnames(dat)

barplot(counts, 
        beside=TRUE, 
        col=c(), 
        border="white",
        xlab="R хороший?", 
        ylab = "Число ответов", 
        font.lab=1,
        font.axis=2,
        legend = rownames(counts))

?legend

png("Bar.png", width = 9, height = 4, units = 'in', res = 300)
barplot(counts, 
        beside=TRUE, 
        col=c(), 
        border="white",
        xlab="R хороший?", 
        ylab = "Число ответов", 
        font.lab=1,
        font.axis=2,
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           cex = 0.6, 
                           horiz = TRUE))
dev.off()
getwd()
utils::browseURL(getwd())

bar <- barplot(counts, 
               beside=TRUE, 
               col=c(), 
               border="white",
               xlab="R хороший?", 
               ylab = "Число ответов", 
               font.lab=1,
               font.axis=2,
               legend = rownames(counts),
               args.legend = list(x = 15, 
                                  y = 178,
                                  cex = 0.6, 
                                  horiz = TRUE))
labels <- LETTERS[1:12]

bar
xpos <- as.vector(bar)
xpos

counts
ypos <- as.vector(counts)

barplot(counts, 
        beside=TRUE, 
        col=c(), 
        border="white",
        xlab="R хороший?", 
        ylab = "Число ответов", 
        font.lab=1,
        font.axis=2,
        legend = rownames(counts),
        args.legend = list(x = 15, 
                           y = 178,
                           cex = 0.6, 
                           horiz = TRUE))

text(labels, x = xpos, y = ypos, cex = 0.6)

count_perc <- apply(counts, 2, function(x){x /sum(x) * 100})
perc <- round(as.vector(round(count_perc)))

labels <- paste(perc, "%", sep = "")

png("Bar02.png", width = 9, height = 4, units = 'in', res = 300)
bar <- barplot(counts, 
               beside=TRUE, 
               col=c(), 
               border="white",
               xlab="R хороший?", 
               ylab = "Число ответов", 
               font.lab=1,
               font.axis=2,
               legend = rownames(counts),
               args.legend = list(x = 15, 
                                  y = 178,
                                  cex = 0.6, 
                                  horiz = TRUE))
text(labels, x = xpos, 
     y = ypos - 5, cex = 0.6, font = 2)
dev.off()

png("Bar03.png", width = 9, height = 4, units = 'in', res = 300)
bar <- barplot(counts, 
               beside=TRUE, 
               col=c(), 
               border="white",
               xlab="R хороший?", 
               ylab = "Число ответов", 
               font.lab=1,
               font.axis=2,
               legend = rownames(counts),
               args.legend = list(x = 15, 
                                  y = 178,
                                  cex = 0.6, 
                                  horiz = TRUE))

my.colors <- rep(c("gray90", "gray20", "black"), 4)

text(labels, x = xpos, 
     y = ypos - 5, cex = 0.6, font = 2, 
     col = my.colors)
dev.off()



