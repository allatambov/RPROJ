#########################################################
#### PART 01 TYPES OF TABLES ############################
#########################################################

data()
mtcars
class(mtcars)
AirPassengers
class(AirPassengers)
diff(AirPassengers, differences = 1)
plot(AirPassengers)

HairEyeColor
class(HairEyeColor)
dim(HairEyeColor)

margin.table(HairEyeColor, 1)
margin.table(HairEyeColor, 2)
margin.table(HairEyeColor, 3)
prop.table(HairEyeColor)

#########################################################
#### PART 02 DATAFRAME ##### ############################
#########################################################

# choose avocado_new.csv
# from https://github.com/allatambov/RPROJ/blob/main/avocado_new.csv

avo <- read.csv(file.choose())

# formal structure 
# and descriptive stats
str(avo)
summary(avo)

table(avo$type)
table(as.factor(avo$type))

# factor type
avo$type <- as.factor(avo$type)
summary(avo)

?factor

View(head(avo))
View(tail(avo))

# deleting NAs
avo <- na.omit(avo)

# renaming columns
rownames(avo)
colnames(avo)
colnames(avo) <- tolower(colnames(avo))

# baisc filtering,
# choosing rows & columns

org <- avo[avo$type == "organic", ]
org2 <- avo[avo$type == "organic", c(2, 4)]
org2 <- avo[avo$type == "organic", 
    c("date", "total.volume")]
org3 <- avo[avo$type == "organic", -c(2, 4)]
