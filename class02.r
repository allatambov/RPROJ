#########################################################
#### PART 01 MATRICES AND APPLY #########################
#########################################################

M <- matrix(10:21, nrow = 4)
rownames(M) <- month.abb[1:4]
colnames(M) <- c("Nif-Nif", 
                 "Naf-Naf", 
                 "Nuf-Nuf")
M

# vectorized operations
# apply by rows or columns
apply(M, 1, sum)
apply(M, 2, sum)
apply(M, 1, sd)
apply(M, 2, sd)

apply(M, 1, function(x){x / sum(x) * 100})
apply(M, 2, function(x){x / sum(x) * 100})


#########################################################
#### PART 02 NAMED VECTORS AND LISTS ####################
#########################################################

table(c(4, 4, 4, 7, 8, 7))

answers <- c(yes = 20, no = 10) 
answers

answers <- c(yes = 20, no = "no data") 
answers

pairs <- list("Да" = "yes", 
     "Нет" = "no",
     "Нет ответа" = NA)
pairs

pairs[1]
class(pairs[1])
pairs[[1]]
class(pairs[[1]])

pairs[[1]][1]
pairs$Да
pairs$`Нет ответа`

L <- list(data = "students", 
          names = c("Elaine", "Cassandra", "Harry"), 
          marks = c(6, 8, 9))
L

L$names
L$data
L$marks[2]
L[[3]][2]
L[3][2]

#########################################################
#### PART 03 FOR LOOP AND STRINGS #######################
#########################################################

files <- c("France.csv", 
           "Spain.csv", 
           "Slovenia.csv", 
           "Brazil.csv")

for (f in files){
  print(f)
}

f <- files[1]
f

name <- toupper(strsplit(f, "\\.")[[1]][1])
name

for (f in files){
  name <- toupper(strsplit(f, "\\.")[[1]][1])
  print(name)
  }

