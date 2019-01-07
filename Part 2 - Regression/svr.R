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

#install.packages("e1071")
library(e1071)
dataset<-dataset[3:2]
regressor <- svm(formula = Salary ~ Level, data = dataset, type='eps-regression')
summary(regressor)

predict(regressor, data.frame(Level=6.5))

fineRange <- seq(min(dataset$Level), max(dataset$Level), by=(max(dataset$Level)-min(dataset$Level))/1000)

library(ggplot2)
ggplot() + geom_point(aes(x=dataset$Level, y=dataset$Salary)) +
geom_line(aes(x=fineRange, y=predict(regressor, data.frame(Level=fineRange))), col='blue') +
  ggtitle("truth or bluff") + 
  xlab("Level") +
  ylab("Salary")