yeast_data=read.table(url("https://archive.ics.uci.edu/ml/machine-learning-databases/yeast/yeast.data"),col.names = col_names)
col_names <- c("Sequence Name","mcg","gvh","alm","mit","erl","pox","vac","nuc","class")
yeast_data
summary(yeast_data)

#a.Perform ANOVA test on the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins by class variables (Target).
library(lattice)

yeast_test =aov(yeast_data$nuc ~ yeast_data$class , yeast_data)
summary(yeast_test)
#Ho = There is no relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins
#H1 = There is a relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins

##Findings
# Based on the pValue ,We fail to reject the null hypothesis and conlude that there is  no relationship between the discriminant analysis scores of nuclear localization signals of both nuclear 
#and non-nuclear proteins 

#b. Which class is significantly different from others?

TukeyHSD(yeast_test)
library(gplots)
plotmeans(nuc ~ class,xlab="Class",ylab="nuc",main="Mean plot",data = yeast_data)
#ERL is signifficantly  different from the other classes
