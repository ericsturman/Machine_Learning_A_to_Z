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

dataset[4:6] <- data.frame(sq = dataset$Level ^ 2, cu = dataset$Level ^ 3, qu = dataset$Level ^ 4)