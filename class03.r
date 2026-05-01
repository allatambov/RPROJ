#########################################################
#### PART 01 CONDITIONS #################################
#########################################################

users.before <- 125
users.after <- 138

users.after > users.before
users.after == users.before
users.after != users.before

users.after > 100 & users.before > 100
users.after > 100 & users.before < 100
users.after > 100 | users.before < 100
# and or xor (^)

xor(users.before > users.after, users.before >= 100)

#########################################################
#### PART 02 FILTERING VECTORS ##########################
#########################################################

temp <- c(17, 20, 21, 24, 18, 16, 14)
temp > mean(temp)
sum(temp > mean(temp))
length(temp[temp > mean(temp)])

#########################################################
#### PART 03 IF-ELSE ####################################
#########################################################

money <- 45

if (money > 60){
  print("Yes")
}

if (money > 60) print("Yes")

if (money > 60){
  print("Yes")
} else {
  print("No")
}

if (money > 60 | money < 100){
  print("Yes")
} else {
  print("No")
}

cities <- c("Мурманск", "Киров", "Пермь")
city <- "Омск"

# operator %in%

if (city %in% cities){
  print("Yes")
} else {
  print("No")
}

c(3, 2) * c(0, 3)
c(3, 2) %*% c(0, 3)

#########################################################
#### PART 04 FUNCTIONS ##################################
#########################################################

fraud <- function(v){
  n <- sum(v %% 5 == 0)
  return(n)
}

fraud <- function(v){
  n <- sum(v %% 5 == 0)
  print("Checking...")
  n
}

fraud(c(4, 5, 15, 6, 7, 10))

test <- function(x, y){
  return(x ** y)
}

test(5, 2)

test2 <- function(x, y){
  return(x ** y, y ** x)
}

test2(5, 2)

test2 <- function(x, y){
  return(c(x ** y, y ** x))
}

test2(5, 2)

test2 <- function(x, y){
  return(list(x ** y, y ** x))
}

test2(5, 2)
