install.packages("jsonify")
library(jsonify)
level_data <- jsonify::from_json( "levels.json" )
library(data.table)
library(ggplot2)

#level_data_frame <- rbindlist(level_data,fill = TRUE)

ggplot(level_data, aes(x = levelID, fill=material)) + geom_bar()


ggplot(level_data, aes(x = factor(levelID), fill=material)) +
  geom_bar(width = 0.5)+
  facet_wrap( ~ shape)+ 
  xlab("Level ID")+
  ylab("Occurance of elements in level")


# Objects per Level
obj_per_level <- c(36,12,40,43,64,34,32,27,65,36,52,41,50,45,54,33,27,32,32,31,68)
birds_per_level <- c(4,5,4,4,3,3,4,5,3,4,3,6,4,3,5,3,4,3,3,5,8)
pigs_per_level <- c(3,4,5,4,4,7,4,6,6,3,4,7,5,4,4,5,9,1,1,2,3)

mean(obj_per_level)
median(obj_per_level)
min(obj_per_level)
max(obj_per_level)

mean(birds_per_level)
median(birds_per_level)
min(birds_per_level)
max(birds_per_level)

mean(pigs_per_level)
median(pigs_per_level)
min(pigs_per_level)
max(pigs_per_level)


