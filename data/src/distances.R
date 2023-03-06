library(jsonify)
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")

distances <- jsonify::from_json( "distances.json" )

View(disan)


ggplot(distances ,aes(x = distance)) + 
  geom_histogram(aes(y = stat(density)),binwidth = 10  ) + 
  geom_vline(xintercept =  median(distances$distance))

median(distances$distance)


min(distances$distance)





distance_in_level <- c(189,
                       127,
                       286,
                       158,
                       166,
                       130,
                       213,
                       298,
                       498,
                       114,
                       222,
                       344,
                       211,
                       245,
                       291,
                       268,
                       167,
                       157,
                       161,
                       104,
                       192)

mean(distance_in_level)

median(distance_in_level)


