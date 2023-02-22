library(jsonify)
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")

onecase_data <- jsonify::from_json( "onecase-result.json" )


ggplot(data.frame(value = onecase_data), aes(x=value)) + 
  geom_histogram(binwidth = .02) +
  xlab("amount of optional predicates matching")+
  ylab("number of configurations")+
  ggtitle("distribtion of score for one case on the situation from which it was generated")


bin <- read.csv("binningresult.csv", header = FALSE)
means_per_case <-sapply(bin, FUN = mean) 
median(means_per_case)


sum_per_level <- sapply(data.frame(t(bin)), FUN = sum)


sum_per_level

mean(sum_per_level)
median(sum_per_level)
max(sum_per_level)


ggplot(data=data.frame(value = sum_per_level, id = 1:21)) + 
  geom_point(aes(y = value, x=id))+
  ggtitle("Sum of possible matches of all case for given level, log scale") +
  xlab("Level")+
  ylab("Sum of possible configurations")+
  scale_y_continuous(trans='log10')

means_per_case +1


ggplot(data=data.frame(value = means_per_case + 1), aes(x=value)) + 
  geom_histogram(bins = 50) +
  ggtitle("Mean possible matches per case over every level, log scale") +
  geom_vline(aes(xintercept = mean(means_per_case), col='mean'),size=1) +
  geom_vline(aes(xintercept = median(means_per_case), col='median'), size=1) +
  labs(colour='')+
  scale_x_continuous(trans='log10')


# findall(L, (findall(ID, db:case(ID, _), Cases), member(ID, Cases), db:testAssignment(ID, List, 0), length(List, L)), Ls).
# objects per case old run
# data <- c(9, 17, 17, 11, 36, 41, 28, 2, 18, 14, 21, 12, 30, 32, 19, 28, 23, 25, 22, 37, 33, 2, 8, 32, 29, 12, 28, 28, 26, 17, 3, 4, 27, 10, 4, 10, 32, 9, 6, 27, 24, 49, 32, 27, 5, 27, 31, 30, 25, 27, 30, 32, 18, 26, 10, 24, 24, 26)

# objects per case new run
data <- c(19, 21, 37, 40, 55, 9, 7, 18, 3, 25, 49, 20, 8, 5, 3, 30, 5, 10, 30, 15, 3, 5, 10, 4, 3, 39, 2, 15, 29, 16, 27, 32, 28, 11, 28, 21, 22, 21, 27, 10, 27, 30, 27, 27, 42, 16, 27, 9, 8, 7, 13, 34, 27, 17, 23, 12, 27, 6, 32, 27)


ggplot(data=data.frame(value = data), aes(x=value)) + 
  geom_histogram(bins = max(data)) +
  ggtitle("Objects per case") +
  geom_vline(aes(xintercept = mean(data), col='mean'),size=1) +
  geom_vline(aes(xintercept = median(data), col='median'), size=1) +
  labs(colour='')

min(data)
max(data)
mean(data)
median(data)


mean_obj_per_level = 40.66667

mean(data) ** mean_obj_per_level

factorial(mean_obj_per_level) / factorial(mean_obj_per_level - mean(data))


predicates_per_case = c(419, 498, 1532, 1772, 3193, 105, 65, 376, 15, 688, 2562, 484, 86, 35, 13, 1006, 35, 123, 991, 261, 14, 36, 140, 24, 16, 1688, 7, 264, 911, 299, 812, 1154, 868, 160, 868, 531, 543, 507, 815, 119, 809, 991, 812, 812, 1959, 294, 806, 100, 85, 64, 204, 1276, 806, 335, 578, 167, 812, 47, 1154, 812)
df <- data.frame(objs = data, relations = predicates_per_case)
ggplot(data=df, aes(x=objs, y = relations)) + 
  geom_point() +
  geom_smooth(se = FALSE, method = "lm", formula =  y ~ poly(x, 2)) +
  xlab("Objects per case") + 
  ylab("Predicates per case")


