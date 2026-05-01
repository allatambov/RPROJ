#########################################################
#### PRACTICE 02 02: FILES AND LINE CHART ###############
#########################################################

# copy the path to the folder with data,
# see archive.zip (Github repo),
# then make this folder working directory

path <- "D:/Downloads/archive"
path <- "/Users/allat/Desktop/archive"
setwd(path)
getwd()

# list files inside
files <- list.files()
files

# choose one, read and describe
f <- files[1]
dat <- read.csv(f)
summary(dat)

# filter data,
# take two columns

march <- dat[dat$MAR != 999.9, c(1, 4)]
years <- march$YEAR
temp <- march$MAR

# create a line plot 
# for temperature dynamics

nyears <- length(years)
plot(x = years, y = temp, 
     "o", pch = 20,
     xlab = "Year", 
     ylab = "Temperature (C)")
grid(nx = nyears, ny = 10)

# prepare everything for graph names,
# grab the name from the file name

name <- toupper(gsub("_", " ", 
                     strsplit(f, "\\.")[[1]][1]))
name

# check how it works on one file
graph <- paste(name, ".png", sep = "")
png(graph, units = "in", width = 8, 
    height = 4.5, res = 300)
plot(x = years, y = temp, 
     ann = FALSE,
     cex = 0,
     xaxt = "n")
grid(nx = nyears, ny = 10)
plot(x = years, y = temp, 
     "o", pch = 20,
     xlab = "Year", 
     ylab = "Temperature (C)",
     main = name,
     xaxt = "n")
axis(1, at = min(years):max(years), 
     las = 2)
dev.off()

# loop over all files,
# get several png-files

for (f in files){
  dat <- read.csv(f)
  march <- dat[dat$MAR != 999.9, c(1, 4)]
  years <- march$YEAR
  temp <- march$MAR
  nyears <- length(years)
  name <- toupper(gsub("_", " ", 
                       strsplit(f, "\\.")[[1]][1]))
  graph <- paste(name, ".png", sep = "")
  png(graph, units = "in", width = 8, 
      height = 4.5, res = 300)
  plot(x = years, y = temp, 
       "o", pch = 20,
       xlab = "Year", 
       ylab = "Temperature (C)",
       main = name,
       xaxt = "n")
  axis(1, at = min(years):max(years), 
       las = 2)
  grid(nx = nyears, ny = 10)
  dev.off()
}
