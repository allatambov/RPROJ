#########################################################
#### PART 01 VECTORS: TYPES #############################
#########################################################

# types: numeric, character, logical

v1 <- c(3, 5, 8, 9)
v2 <- c(3, 6.6, 8, 9)
v3 <- c("2,5", "3", 8, 9)
v4 <- c(TRUE, FALSE)
c(T, F) # T = TRUE, F = FALSE

v1

# class() vs typeof()

class(v1); typeof(v1)
class(v2); typeof(v2)
class(v3); typeof(v3)

# type conversion
# as.integer(), as.numeric(), etc

v5 <- as.integer(v1)
class(v5); typeof(v5)

# type check
# is.integer(), is.numeric(), etc

is.integer(v5)
is.integer(v1)

#########################################################
#### PART 02 VECTORS: CHOOSING ELEMENTS #################
#########################################################

long <- c(1, 9, 8, 4, 1, 9, 8, 5)
length(long)

long[1]
long[0]
long[9]
long[2:4]
long[2:9]
long[2:10]
long[2:] # both end needed
long[-1]
long[-2:-4]
long[-2:0]

long[c(2, 5, 8)]
long[c(2, 5:8)]
long[c(-2, -5, -8)]
long[-c(2, 5, 8)]
-c(2, 5, 8)

# merging vectors

c(1, 2, 3) + c(1, 0, 0)
c(c(1, 2, 3), c(1, 0, 0))
c(1, 2, 3) + c(1, 2)

#########################################################
#### PART 03 SEQUENCES ##################################
#########################################################

1:10
25:40

seq(1, 20, 2)
1:20:2 # not possible

seq(1, 20, length.out = 10)
seq(0, 20, length.out = 5)

labs <- c("A", "B", "C", "D")
seq(1, 20, along.with = labs)

rep("A", 3)
rep(NA, 10)
rep(c("red", "blue"), 4)
rep(c("red", "blue"), each = 4)
?rep

# prepared sequences

letters
LETTERS
month.name
month.abb
colors()

# dates and dates formatting

d1 <- ISOdate(2025, 1, 1)
ISOdate(2025, 1:12, 1)
ISOdate(2025, 1:12, 1:30)

format(ISOdate(2025, 1:12, 1), "%D")
format(ISOdate(2025, 1:12, 1), "%d %B %Y")
format(ISOdate(2025, 1:12, 1), "%d %b %Y")
format(ISOdate(2025, 1:12, 1), "%d %B %Y (%A)")
format(ISOdate(2025, 1:12, 1), "%d %B %Y (%a)")

#########################################################
#### PART 04 JOINING CHARACTERS #########################
#########################################################

paste("группа", 231:233)
paste("группа", 231:233, sep = "_")
# "/".join(["12", "02", "2025"])
parts <- c("12", "02", "2025")
paste(parts, sep = "/")
paste(parts, collapse = "/")

#########################################################
#### PART 05 MATRICES ###################################
#########################################################

M <- matrix(10:21, nrow = 4)
rownames(M) <- month.abb[1:4]
colnames(M) <- c("Nif-Nif", 
                 "Naf-Naf", 
                 "Nuf-Nuf")
M
colSums(M)
rowSums(M)
colMeans(M)
rowMeans(M)

name <- LETTERS[1:5]
bin <- c(0, 1, 0, 1, 0)

# bind as columns - cbind()
# bind as rows - rbind()

mat.dat <- cbind(name, bin)
mat.dat2 <- rbind(name, bin)

# matrix can contain elements 
# of one type only

tab <- cbind.data.frame(name, bin)
as.vector(M)

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

