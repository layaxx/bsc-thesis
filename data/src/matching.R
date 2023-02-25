
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")
matchScores <- read.csv("matchScores.csv", header=FALSE)


View(matchScores)


matchScores$time = unlist(map(matchScores$V6, function (x) strsplit(x, "cpu:")[[1]][[2]]))


library(purrr)

length(matchScores[matchScores$V1 == "mch",]$V5)


matchScores[matchScores$V1 == "random",]

matchScores$V5


strsplit(matchScores$V6[[1]], ":")[[1]][[2]]

# time on y, iterations on x
# score on y, iterations on x
# min max median score





ggplot(matchScores, aes(x= V3, y=time, color = V1)) + geom_point()
