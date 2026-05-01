#########################################################
#### PROBLEMS ###########################################
#########################################################

# see here: https://disk.yandex.ru/d/tqGmCNJsfK5APg

fweigh <- c(234, 67, 19, 4, 176, 109, 34, 88, 256, 287, 121,
            348, 901, 499, 1, 0.5, 72, 231, 213, 0.2, 5,
            1034, 9, 121, 448, 239, 663, 238, 810, 6)
sum(fweigh == 121)
sum(fweigh > 200 & fweigh < 400)
sum(fweigh <= 10)
sum(fweigh > 900 | fweigh < 1)
which(fweigh <= 1)

coffee <- c(Ann = 2, Alice = 3, Rowena = 1, Nick = 0)
resp <- "Ro"

if (resp %in% names(coffee)){
  print(coffee[[resp]])
} else {
  print("No such respondent")
}


