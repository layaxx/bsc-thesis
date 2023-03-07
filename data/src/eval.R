library(jsonify)
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")

eval <- jsonify::from_json( "eval_data.json" )

View(eval)


pre_strats <- jsonify::from_json( "strategies.json" , fill_na = T, simplify = T)

ggplot(pre_strats, aes(x= type, fill = strategy)) + geom_bar()

aggregate(pre_strats[pre_strats$type == "executed",], FUN = length, by = list(pre_strats[pre_strats$type == "executed",]$strategy))
aggregate(pre_strats[pre_strats$type == "candidate",], FUN = length, by = list(pre_strats[pre_strats$type == "candidate",]$strategy))

tbl <- table( pre_strats$strategy, pre_strats$type )

 tbl[,2]  / length(pre_strats$type[pre_strats$type == "executed"])

 

 
View(pre_strats)

length(pre_strats$type == "candidate")

strats <- jsonify::from_json( "eval_strats.json" , fill_na = T, simplify = T)

View(strats)


sum(eval[eval$id == "EIA_split",]$score)


ggplot(eval, aes(x = time, y  = score, color=id)) + 
  geom_point() + facet_wrap(.~level)

ggplot(eval, aes(x = level, y  = score, color=id)) + 
  geom_point() + 
  labs(colour='Set of Relations')

ggplot(eval[which(eval$score>0),], aes(x = id, y  = score, color=id)) + 
  geom_boxplot(show.legend = F) + xlab("")

ggplot(
  aggregate(eval$score, list(by = eval$id), FUN = sum), aes(x=by, y = x)) + geom_col()

ggplot(eval, aes(x = id, y = score, fill=id)) + geom_col(show.legend = F)


# Won Plot
ggplot(eval, aes( level, id, fill=score > 0)) +
  geom_tile() +
  theme(
    axis.line.x=element_blank(),
  )+ coord_equal(expand = F) +
  labs(fill='Level cleared') + ylab("")


ggplot(eval[which(eval$score>0),], aes(x = id, fill=id)) + 
  geom_bar(show.legend = F) + xlab("") + ylab("Number of cleared Levels")

strats$strat <- factor(strats$strat, levels=c("demo", "targetPig",  "QCBR"))
  

ggplot(
    na.omit(strats),
    aes(x = id, fill=strat),
  )+ geom_bar(position = "fill") + facet_grid(.  ~ type) + xlab("") + ylab("frequency")



aggregate(eval[which(eval$score>0),], by=list(eval[which(eval$score>0),]$id), FUN = mean )


aggregate(
  strats[strats$type == "executed",], by=list(
    strats[strats$type == "executed",]$id), FUN = length)

mean(c(156,156,155,164,159,161,159))

mean(c(179,172))

       