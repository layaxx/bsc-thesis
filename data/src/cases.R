library(jsonify)
library(ggplot2)

setwd("C:\\Users\\layax\\Documents\\Uni\\s7_bachelorarbeit\\paper\\data\\src")

cases <- jsonify::from_json( "eva_cases.json" )

View(cases)

cases_success <- jsonify::from_json( "eva_cases_success.json")


ggplot(cases_success, aes(x = id, fill=factor(cases_success$successful, c("no", "partial", "complete")))) + 
  geom_bar(position = "fill") + 
  xlab("") + 
  ylab("rate of successful case applications") + 
  labs(fill="success")

cases$level <- as.integer(cases$level)


ggplot(cases, aes(x = id, fill=caseID)) + 
  geom_bar() + facet_wrap(level~.)+ 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
