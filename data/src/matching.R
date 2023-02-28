
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")
matchScores <- read.csv("matchScores.csv", header=TRUE)


View(matchScores)



library(purrr)

mean(matchScores[matchScores$algorithm == "random",]$score)


matchScores[matchScores$V1 == "random",]

matchScores$V5


strsplit(matchScores$V6[[1]], ":")[[1]][[2]]

# time on y, iterations on x
# score on y, iterations on x
# min max median score

ggplot(matchScores, aes(x= time, y= score, color = algorithm)) + geom_point()  +facet_grid(cols = vars(level))

ggplot(matchScores, aes(y= time, color = algorithm)) + geom_boxplot() +facet_grid(cols = vars(iterations))
