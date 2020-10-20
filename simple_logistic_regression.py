# Simple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('user_support.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values

# # Splitting the dataset into the Training set and Test set
# from sklearn.model_selection import train_test_split
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)

# # Training the Simple Linear Regression model on the Training set
from sklearn.linear_model import LogisticRegression
# regressor = LinearRegression()
# regressor.fit(X_train, y_train)
clf = LogisticRegression(C=1e5)
clf.fit(X, y)

fittedLine = np.arange(min(X), max(X), 0.01)
fittedLine = fittedLine.reshape((len(fittedLine), 1))
# # Predicting the Test set results
# y_pred = regressor.predict(X_test)

# # Visualising the Training set results
# plt.scatter(X_train, y_train, color = 'red')
# plt.plot(X_train, regressor.predict(X_train), color = 'blue')
# plt.title('Salary vs Experience (Training set)')
# plt.xlabel('Years of Experience')
# plt.ylabel('Salary')
# plt.show()

# Visualising the Test set results
plt.scatter(X, y, color = 'red')
plt.plot(fittedLine, clf.predict_proba(fittedLine)[:,1], color = 'blue')
plt.plot(fittedLine, clf.predict(fittedLine), color = 'green')
plt.title('user support')
plt.xlabel('usage count')
plt.ylabel('required help')
plt.show()
