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

getFrame <- function(num){
  return(data.frame(Level=num, sq=num^2, cu=num^3, qu=num^4))
}

dataset<-dataset[3:2]
dataset[3:5] <- data.frame(sq = dataset$Level ^ 2, cu = dataset$Level ^ 3, qu = dataset$Level ^ 4)
regressor <- lm(formula = Salary ~ Level + sq + cu + qu, data = dataset)
summary(regressor)

predict(regressor, getFrame(6.5))

library(ggplot2)
ggplot() + geom_point(aes(x=dataset$Level, y=dataset$Salary)) +
geom_line(aes(x=dataset$Level, y=predict(regressor, getFrame(dataset$Level))), col='blue') +
  ggtitle("truth or bluff") + 
  xlab("Level") +
  ylab("Salary")