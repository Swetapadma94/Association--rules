#Association Rules
install.packages("arules")
library(arules)
Titanic<-read.csv("E:\\srinivas excelr\\data set\\Titanic.csv")

Titanic<-Titanic[,-c(1)]
rules <- apriori(Titanic)
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)

# rules with rhs containing "Survived" only
rules <- apriori(Titanic,parameter = list(supp=0.1, conf=0.5)
                 ,appearance = list(rhs=c("Survived=No", "Survived=Yes")
                  ),control = list(verbose=F))
## verbose- exclude all un-necessary data
arules::inspect(rules)
