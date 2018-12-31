# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split <- sample.split(dataset$Salary, SplitRatio = 0.8)
# training_set <- subset(dataset, split == TRUE)
# test_set <- subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#install.packages("randomForest")
library(randomForest)
#regressor <- randomForest(formula = Salary ~ Level, data = dataset, ntree=100)  #this line and line befor are identical...
regressor <- randomForest(x = data.frame(Level = dataset$Level), y=dataset$Salary, data = dataset, ntree=100)

summary(regressor)

predict(regressor, data.frame(Level=6.5))

fineRange <- seq(min(dataset$Level), max(dataset$Level), by=(max(dataset$Level)-min(dataset$Level))/1000)

library(ggplot2)
ggplot() + geom_point(aes(x=dataset$Level, y=dataset$Salary)) +
geom_line(aes(x=fineRange, y=predict(regressor, data.frame(Level=fineRange))), col='blue') +
  ggtitle("truth or bluff random forest") + 
  xlab("Level") +
  ylab("Salary")