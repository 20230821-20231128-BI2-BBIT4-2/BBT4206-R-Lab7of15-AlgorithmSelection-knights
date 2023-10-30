.libPaths()

lapply(.libPaths(), list.files)

if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

#Install and Load the Required Packages ----
## stats ----
if (require("stats")) {
  require("stats")
} else {
  install.packages("stats", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## MASS ----
if (require("MASS")) {
  require("MASS")
} else {
  install.packages("MASS", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## glmnet ----
if (require("glmnet")) {
  require("glmnet")
} else {
  install.packages("glmnet", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## kernlab ----
if (require("kernlab")) {
  require("kernlab")
} else {
  install.packages("kernlab", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## rpart ----
if (require("rpart")) {
  require("rpart")
} else {
  install.packages("rpart", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# A. Linear Algorithms ----
## 1. Linear Regression ----
### 1.a. Linear Regression using Ordinary Least Squares without caret ----
# The lm() function is in the stats package and creates a linear regression
# model using ordinary least squares (OLS).

### Load and split the dataset
Student_Marks <- read_csv("data/Student_Marks.csv")
View(Student_Marks)
Student_no_na <- na.omit(Student_Marks)

### Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(Student_Marks$Marks,
                                   p = 0.8,
                                   list = FALSE)
Student_Marks_train <- Student_Marks[train_index, ]
Student_Marks_test <- Student_Marks[-train_index, ]

### Train the model
Student_Marks_lm <- lm(Marks ~ ., data = Student_Marks_train)

### Display the model's details
print(Student_Marks_lm)

### Make predictions
predictions <- predict(Student_Marks_lm, newdata = Student_Marks_test[, 1:3])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((Student_Marks_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((Student_Marks_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((Student_Marks_test$Marks - mean(Student_Marks_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - Student_Marks_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

### 1.b. Linear Regression using Ordinary Least Squares with caret ----
### Load and split the dataset
Student_Marks <- read_csv("data/Student_Marks.csv")
View(Student_Marks)
Student_no_na <- na.omit(Student_Marks)

### Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(Student_Marks$Marks, p = 0.8, list = FALSE)
Student_marks_train <- Student_Marks[train_index, ]
Student_marks_test <- Student_Marks[-train_index, ]

### Train the model using caret
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
Student_marks_caret_model_lm <- train(Marks ~ ., data = Student_marks_train,
                                      method = "lm", metric = "RMSE",
                                      preProcess = c("center", "scale"),
                                      trControl = train_control)

### Display the model's details
print(Student_marks_caret_model_lm)

### Make predictions
predictions <- predict(Student_marks_caret_model_lm, Student_marks_test[, 1:3])

### Display the model's evaluation metrics
### RMSE
rmse <- sqrt(mean((Student_marks_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

### SSR
ssr <- sum((Student_marks_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

### SST
sst <- sum((Student_marks_test$Marks - mean(Student_marks_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

### R Squared
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

### MAE
absolute_errors <- abs(predictions - Student_marks_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 2. Logistic Regression ----
### 2.a. Logistic Regression without caret ----
# The glm() function is in the stats package and creates a
# generalized linear model for regression or classification.
# It can be configured to perform a logistic regression suitable for binary
# classification problems.

#### Load and split the dataset ----
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")
Customer_Churn$Churn <- ifelse(Customer_Churn$Churn == "No", 0, 1)

View(Customer_Churn)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(Customer_Churn$Churn,
                                   p = 0.7,
                                   list = FALSE)
Customer_Churn_train <- Customer_Churn[train_index, ]
Customer_Churn_test <- Customer_Churn[-train_index, ]

#### Train the model ----
Customer_Churn_model_glm <- glm(Churn ~ ., data = Customer_Churn_train,
                                family = binomial(link = "logit"))

#### Display the model's details ----
print(Customer_Churn_model_glm)

#### Make predictions ----
probabilities <- predict(Customer_Churn_model_glm, Customer_Churn_test[, 1:14],
                         type = "response")
print(probabilities)
predictions <- ifelse(probabilities > 0.5, "Yes", "No")
print(predictions)

#### Display the model's evaluation metrics ----
table(predictions, Customer_Churn_test$Churn)

### 2.b. Logistic Regression with caret ----
#### Load and split the dataset ----
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")
Customer_Churn$Churn <- ifelse(Customer_Churn$Churn == "No", 0, 1)

View(Customer_Churn)

# Define a 70:30 train:test data split of the dataset.
set.seed(7)
sample_indices <- sample(seq_len(nrow(Customer_Churn)), size = 0.7 * nrow(Customer_Churn))
Customer_Churn_train <- Customer_Churn[sample_indices, ]
Customer_Churn_test <- Customer_Churn[-sample_indices, ]

### Train the model
Customer_Churn_model_glm <- glm(Churn ~ ., data = Customer_Churn_train, family = binomial(link = "logit"))

### Display the model's details
summary(Customer_Churn_model_glm)

### Make predictions
probabilities <- predict(Customer_Churn_model_glm, Customer_Churn_test, type = "response")
predictions <- ifelse(probabilities > 0.5, 1, 0)

### Display the model's evaluation metrics
confusion_matrix <- table(predictions, Customer_Churn_test$Churn)
print(confusion_matrix)

## 3. Linear Discriminant Analysis ----
### 3.a. Linear Discriminant Analysis without caret ----
# The lda() function is in the MASS package and creates a linear model of a
# multi-class classification problem.

# Load and split the dataset
library(readr)
Crop_recommendation <- read_csv("data/Crop_recommendation.csv")
Crop_recommendation$label <- ifelse(Crop_recommendation$label == "rice", 0, 1)
View(Crop_recommendation)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(Crop_recommendation$label, p = 0.7, list = FALSE)
Crop_recommendation_train <- Crop_recommendation[train_index, ]
Crop_recommendation_test <- Crop_recommendation[-train_index, ]

# Convert "label" to a factor with appropriate levels
Crop_recommendation_train$label <- factor(Crop_recommendation_train$label)
Crop_recommendation_test$label <- factor(Crop_recommendation_test$label)

# Train the LDA model with "label" as a factor
library(MASS) # Make sure the MASS package is loaded
label_model_lda <- lda(label ~ ., data = Crop_recommendation_train)

# Display the model's details
print(label_model_lda)

# Make predictions
predictions <- predict(label_model_lda, Crop_recommendation_test[, 1:7])

# Display the model's evaluation metrics
table(predictions$class, Crop_recommendation_test$label)


### 3.b. Linear Discriminant Analysis with caret ----
#### Load and split the dataset ----
library(readr)
Crop_recommendation <- read_csv("data/Crop_recommendation.csv")
Crop_recommendation$label <- ifelse(Crop_recommendation$label == "rice", 0, 1)
View(Crop_recommendation)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(Crop_recommendation$label,
                                   p = 0.7,
                                   list = FALSE)

crop_recommendation_train$label <- as.factor(crop_recommendation_train$label)
crop_recommendation_test$label <- as.factor(crop_recommendation_test$label)


#### Train the model ----
set.seed(7)

# We apply a Leave One Out Cross Validation resampling method
train_control <- trainControl(method = "LOOCV")
# Train the model using "lda2" for classification
crop_recommendation_caret_model_lda <- train(label ~ .,
                                             data = crop_recommendation_train,
                                             method = "lda2",  # Use "lda2" for classification
                                             metric = "Accuracy",
                                             preProcess = c("center", "scale"),
                                             trControl = train_control)

#### Display the model's details ----
print(crop_recommendation_caret_model_lda)

#### Make predictions ----
predictions <- predict(crop_recommendation_caret_model_lda,
                       crop_recommendation_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <- caret::confusionMatrix(predictions,
                                           crop_recommendation_test$label)


print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


## 4. Regularized Linear Regression ----

### 4.c. Regularized Linear Regression Classification Problem with CARET ----
# Load and split the dataset
Student_Marks <- read.csv("data/Student_Marks.csv")
student_no_na <- na.omit(Student_Marks)


# Define a 70:30 train:test data split of the dataset.
set.seed(7)
train_index <- createDataPartition(student_no_na$Marks, p = 0.7, list = FALSE)
Student_Marks_train <- student_no_na[train_index, ]
Student_Marks_test <- student_no_na[-train_index, ]

# Train the model
set.seed(7)
train_control <- trainControl(method = "cv", number = 5, classProbs = TRUE)
Marks_caret_model_glmnet <- train(Marks ~ ., data = Student_Marks_train,
                                  method = "glmnet", trControl = train_control)

#### Display the model's details ----
print(Marks_caret_model_glmnet)

#### Make predictions ----
predictions <- predict(Marks_caret_model_glmnet,
                       Student_Marks_test[, 1:3])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         Student_Marks_test[, 1:3]$Marks)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


### 4.d. Regularized Linear Regression Regression Problem with CARET ----
# Load the dataset (adjust the file path as needed)
Student_Marks <- read.csv("data/Student_Marks.csv")

# Remove rows with missing values
student_no_na <- na.omit(Student_Marks)

# Define a 70:30 train:test data split
set.seed(7)
train_index <- createDataPartition(student_no_na$Marks, p = 0.7, list = FALSE)
student_train <- student_no_na[train_index, ]
student_test <- student_no_na[-train_index, ]

# Train the model
train_control <- trainControl(method = "cv", number = 5)
student_caret_model_glmnet <- train(Marks ~ ., data = student_train, method = "glmnet",
                                    metric = "RMSE", preProcess = c("center", "scale"), trControl = train_control)

# Display the model's details
print(student_caret_model_glmnet)

# Make predictions
predictions <- predict(student_caret_model_glmnet, student_test[, 1:3])

# Display the model's evaluation metrics
# RMSE
rmse <- sqrt(mean((student_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

# SSR
ssr <- sum((student_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

# SST
sst <- sum((student_test$Marks - mean(student_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

# R Squared
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

# MAE
absolute_errors <- abs(predictions - student_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))


# B. Non-Linear Algorithms ----
## 1.  Classification and Regression Trees ----

### 1.c. Decision tree for a classification problem with caret ----
#### Load and split the dataset ----
data(PimaIndiansDiabetes)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(PimaIndiansDiabetes$diabetes,
                                   p = 0.7,
                                   list = FALSE)
pima_indians_diabetes_train <- PimaIndiansDiabetes[train_index, ]
pima_indians_diabetes_test <- PimaIndiansDiabetes[-train_index, ]

#### Train the model ----
set.seed(7)
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
diabetes_caret_model_rpart <- train(diabetes ~ ., data = PimaIndiansDiabetes,
                                    method = "rpart", metric = "Accuracy",
                                    trControl = train_control)

#### Display the model's details ----
print(diabetes_caret_model_rpart)

#### Make predictions ----
predictions <- predict(diabetes_model_rpart,
                       pima_indians_diabetes_test[, 1:8],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, pima_indians_diabetes_test$diabetes)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         pima_indians_diabetes_test[, 1:9]$diabetes)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 1.d. Decision tree for a regression problem with CARET ----
#### Load and split the dataset ----
data(BostonHousing)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(BostonHousing$medv,
                                   p = 0.7,
                                   list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]

#### Train the model ----
set.seed(7)
# 7 fold repeated cross validation with 3 repeats
train_control <- trainControl(method = "repeatedcv", number = 5, repeats = 3)

housing_caret_model_cart <- train(medv ~ ., data = BostonHousing,
                                  method = "rpart", metric = "RMSE",
                                  trControl = train_control)

#### Display the model's details ----
print(housing_caret_model_cart)

#### Make predictions ----
predictions <- predict(housing_caret_model_cart, boston_housing_test[, 1:13])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((boston_housing_test$medv - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((boston_housing_test$medv - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((boston_housing_test$medv - mean(boston_housing_test$medv))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - boston_housing_test$medv)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 2.  Naïve Bayes ----
### 2.b. Naïve Bayes Classifier for a Classification Problem with CARET ----
#### Load and split the dataset ----
data(PimaIndiansDiabetes)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(PimaIndiansDiabetes$diabetes,
                                   p = 0.7,
                                   list = FALSE)
pima_indians_diabetes_train <- PimaIndiansDiabetes[train_index, ]
pima_indians_diabetes_test <- PimaIndiansDiabetes[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
diabetes_caret_model_nb <- train(diabetes ~ .,
                                 data = pima_indians_diabetes_train,
                                 method = "nb", metric = "Accuracy",
                                 trControl = train_control)

#### Display the model's details ----
print(diabetes_caret_model_nb)

#### Make predictions ----
predictions <- predict(diabetes_caret_model_nb,
                       pima_indians_diabetes_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         pima_indians_diabetes_test[, 1:9]$diabetes)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 3.  k-Nearest Neighbours ----
# The knn3() function is in the caret package and does not create a model.
# Instead it makes predictions from the training dataset directly.
# It can be used for classification or regression.

### 3.c. kNN for a classification problem with CARET's train function ----
#### Load and split the dataset ----
data(PimaIndiansDiabetes)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(PimaIndiansDiabetes$diabetes,
                                   p = 0.7,
                                   list = FALSE)
pima_indians_diabetes_train <- PimaIndiansDiabetes[train_index, ]
pima_indians_diabetes_test <- PimaIndiansDiabetes[-train_index, ]

#### Train the model ----
# We apply the 10-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 10)
diabetes_caret_model_knn <- train(diabetes ~ ., data = PimaIndiansDiabetes,
                                  method = "knn", metric = "Accuracy",
                                  preProcess = c("center", "scale"),
                                  trControl = train_control)

#### Display the model's details ----
print(diabetes_caret_model_knn)

#### Make predictions ----
predictions <- predict(diabetes_caret_model_knn,
                       pima_indians_diabetes_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         pima_indians_diabetes_test[, 1:9]$diabetes)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 3.d. kNN for a regression problem with CARET's train function ----
#### Load and split the dataset ----
data(BostonHousing)

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(BostonHousing$medv,
                                   p = 0.8,
                                   list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
housing_caret_model_knn <- train(medv ~ ., data = BostonHousing,
                                 method = "knn", metric = "RMSE",
                                 preProcess = c("center", "scale"),
                                 trControl = train_control)

#### Display the model's details ----
print(housing_caret_model_knn)

#### Make predictions ----
predictions <- predict(housing_caret_model_knn,
                       boston_housing_test[, 1:13])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((boston_housing_test$medv - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((boston_housing_test$medv - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((boston_housing_test$medv - mean(boston_housing_test$medv))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - boston_housing_test$medv)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 4.  Support Vector Machine ---
### 4.c. SVM Classifier for a classification problem with CARET ----
# The SVM with Radial Basis kernel implementation can be used with caret for
# classification as follows:
#### Load and split the dataset ----
data(PimaIndiansDiabetes)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(PimaIndiansDiabetes$diabetes,
                                   p = 0.7,
                                   list = FALSE)
pima_indians_diabetes_train <- PimaIndiansDiabetes[train_index, ]
pima_indians_diabetes_test <- PimaIndiansDiabetes[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
diabetes_caret_model_svm_radial <- # nolint: object_length_linter.
  train(diabetes ~ ., data = pima_indians_diabetes_train, method = "svmRadial",
        metric = "Accuracy", trControl = train_control)

#### Display the model's details ----
print(diabetes_caret_model_svm_radial)

#### Make predictions ----
predictions <- predict(diabetes_caret_model_svm_radial,
                       pima_indians_diabetes_test[, 1:8])

#### Display the model's evaluation metrics ----
table(predictions, pima_indians_diabetes_test$diabetes)
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         pima_indians_diabetes_test[, 1:9]$diabetes)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 4.d. SVM classifier for a regression problem with CARET ----
# The SVM with radial basis kernel implementation can be used with caret for
# regression as follows:
#### Load and split the dataset ----
data(BostonHousing)

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(BostonHousing$medv,
                                   p = 0.8,
                                   list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
housing_caret_model_svm_radial <-
  train(medv ~ ., data = boston_housing_train,
        method = "svmRadial", metric = "RMSE",
        trControl = train_control)

#### Display the model's details ----
print(housing_caret_model_svm_radial)

#### Make predictions ----
predictions <- predict(housing_caret_model_svm_radial,
                       boston_housing_test[, 1:13])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((boston_housing_test$medv - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((boston_housing_test$medv - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((boston_housing_test$medv - mean(boston_housing_test$medv))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - boston_housing_test$medv)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
