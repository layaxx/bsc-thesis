library(jsonify)
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")

classifications <- jsonify::from_json( "results.json" )




classifications$affectedTotal <- classifications$actual$m + classifications$actual$d
classifications$total <- classifications$actual$m + classifications$actual$d + classifications$actual$u
classifications$ratioOfAffected <- sapply(classifications$new, function(x) unlist(x)[1])/classifications$total

View(classifications)
 

ggplot(classifications, aes(x =affectedTotal, y=ratioOfAffected)) +
  geom_point(aes(size=total)) + 
  geom_text(aes(label=total), nudge_y = 0.01) + 
  xlab("Number of affected Objects") +
  xlim(0, 50) + 
  ylab("Ratio of missclassifications") + 
  theme(legend.position="none")
