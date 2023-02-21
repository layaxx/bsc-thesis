install.packages("jsonify")
library(jsonify)
level_data <- jsonify::from_json( "C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\code\\r\\levels.json" )
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
obj_per_level <- c(
  36,
  12,
  40,
  43,
  64,
  34,
  32,
  27,
  65,
  36,
  52,
  41,
  50,
  45,
  54,
  33,
  27,
  32,
  32,
  31,
  68
)

mean(obj_per_level)
median(obj_per_level)




