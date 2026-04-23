# function vs method in Python
# len() vs .append()

# summary - different to vector, data.frame, model

v <- c(1, 6, 7)
summary(v)
mtcars
summary(mtcars)
mymodel <- lm(mtcars$wt ~ mtcars$hp)
summary(mymodel)

methods(summary)
summary.lm(mymodel)
summary.data.frame(mymodel)
summary.manova(mymodel)

#https://njtierney.github.io/r/missing%20data/rbloggers/2016/11/06/simple-s3-methods/

# cauldron

setClass("Cauldron", representation(size = "character", 
                                    material = "character", 
                                    contents = "vector"))

caul <- new("Cauldron", size = "medium", 
            material = "copper", 
            contents = c("lavender"))
caul
str(caul)
caul@size

new("Cauldron", size = 2, material = "copper", 
    contents = c("lavender"))

add <- function(object, element){NA}
setGeneric("add")
setMethod("add", signature(object = "Cauldron"), 
          function(object, element) {
  object@contents <- c(object@contents, element)
  object
})

add(9, 4)
add(caul, "snake fangs")
caul <- add(caul, "snake fangs")
caul

engorgio <- function(object){NA}
setGeneric("engorgio")
setMethod("engorgio", signature(object = "Cauldron"), 
          function(object) {
            object@contents <- toupper(object@contents)
            object@size <- "large"
            object
          })

caul <- engorgio(caul)
caul

expulso <- function(object){NA}
setGeneric("expulso")
setMethod("expulso", signature(object = "Cauldron"), 
          function(object) {
            object@contents <- sapply(strsplit(object@contents, NULL), 
                                             unlist)
            object
          })

caul <- expulso(caul)
caul

reparo <- function(object){NA}
setGeneric("reparo")
setMethod("reparo", signature(object = "Cauldron"), 
          function(object) {
            if (class(object@contents) == 'list'){
              object@contents <- sapply(object@contents, paste, collapse = "")
            }
            object
          })

caul <- reparo(caul)
caul

colovaria <- function(object, color){NA}
setGeneric("colovaria")
setMethod("colovaria", signature(object = "Cauldron"), 
          function(object, color) {
            setClass("Cauldron", representation(size = "character", 
                                                material = "character", 
                                                contents = "vector", 
                                                color = "character"))
            object@color <- color
            object
          })

caul <- colovaria(caul, "red")

transfigure <- function(object){NA}
setGeneric("transfigure")
setMethod("transfigure", signature(object = "Cauldron"), 
          function(object) {
            setClass("Cabbage", representation(size = "character", 
                                                color = "character"))
            new("Cabbage", size = object@size, color = "green")
          })

transfigure(caul)

revelio <- function(object){NA}
setGeneric("revelio")
setMethod("revelio", signature(object = "Cauldron"), 
          function(object) {
            y <- -10:10
            x <- y**2
            z <- seq(20, 80, length.out = 100)
            plot(x, y, type = 'l', 
                 ylim=c(-4, 4), 
                 xlab = "", ylab = "", axes=F)
            lines(-x+100, y)
            lines(z, rep(-4.2, 100))
            lines(z, rep(4.2, 100))
            lines(z, 0.0012*(z-50)**2+3)
            lines(z, 0.0012*(z-50)**2+2.5)
            text(x = 50, y = 0, labels = "I am a cauldron. \n Don't overstir!")
          })

revelio(caul)

### prototypes and inheritance

setClass("Cauldron", slots = list(size = "character", 
                                    material = "character", 
                                    contents = "vector"),
         prototype = list(size = "medium", 
                          material = "copper", 
                          contents = NA
         ))

new("Cauldron")

setClass("MyCauldron", slots = list(),
         contains = "Cauldron")

new("MyCauldron")

setClass("MyCauldron", slots = list(name = "character",
                                    grade = "numeric"),
         contains = "Cauldron")

mycau <- new("MyCauldron", name = "Alla", 
    contents = c("dittany", "ginger"))
mycau
expulso(mycau)

set_grade <- function(object, grade){NA}
setGeneric("set_grade")
setMethod("set_grade", signature(object = "MyCauldron"),
          function(object, grade){
            object@grade <- grade
            object
          }
          )

set_grade(mycau, grade = 0)





