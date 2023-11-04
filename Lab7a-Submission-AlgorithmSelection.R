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
### 1.a. Linear Regression using Ordinary Least Squares without caret ----.

Student_Marks <- read_csv("data/Student_Marks.csv")
View(Student_Marks)
Student_no_na <- na.omit(Student_Marks)


train_index <- createDataPartition(Student_Marks$Marks,
                                   p = 0.8,
                                   list = FALSE)
Student_Marks_train <- Student_Marks[train_index, ]
Student_Marks_test <- Student_Marks[-train_index, ]

Student_Marks_lm <- lm(Marks ~ ., data = Student_Marks_train)

print(Student_Marks_lm)

predictions <- predict(Student_Marks_lm, newdata = Student_Marks_test[, 1:3])


rmse <- sqrt(mean((Student_Marks_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

ssr <- sum((Student_Marks_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

sst <- sum((Student_Marks_test$Marks - mean(Student_Marks_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

absolute_errors <- abs(predictions - Student_Marks_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

### 1.b. Linear Regression using Ordinary Least Squares with caret
Student_Marks <- read_csv("data/Student_Marks.csv")
View(Student_Marks)
Student_no_na <- na.omit(Student_Marks)

train_index <- createDataPartition(Student_Marks$Marks, p = 0.8, list = FALSE)
Student_marks_train <- Student_Marks[train_index, ]
Student_marks_test <- Student_Marks[-train_index, ]

set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
Student_marks_caret_model_lm <- train(Marks ~ ., data = Student_marks_train,
                                      method = "lm", metric = "RMSE",
                                      preProcess = c("center", "scale"),
                                      trControl = train_control)

print(Student_marks_caret_model_lm)

predictions <- predict(Student_marks_caret_model_lm, Student_marks_test[, 1:3])


rmse <- sqrt(mean((Student_marks_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))


ssr <- sum((Student_marks_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

sst <- sum((Student_marks_test$Marks - mean(Student_marks_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

absolute_errors <- abs(predictions - Student_marks_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

## 2. Logistic Regression ----
### 2.b. Logistic Regression with caret ----
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")
Customer_Churn$Churn <- ifelse(Customer_Churn$Churn == "No", 0, 1)

View(Customer_Churn)


set.seed(7)
sample_indices <- sample(seq_len(nrow(Customer_Churn)), size = 0.7 * nrow(Customer_Churn))
Customer_Churn_train <- Customer_Churn[sample_indices, ]
Customer_Churn_test <- Customer_Churn[-sample_indices, ]


Customer_Churn_model_glm <- glm(Churn ~ ., data = Customer_Churn_train, family = binomial(link = "logit"), maxit = 100)


summary(Customer_Churn_model_glm)

probabilities <- predict(Customer_Churn_model_glm, Customer_Churn_test, type = "response")
predictions <- ifelse(probabilities > 0.5, 1, 0)

confusion_matrix <- table(predictions, Customer_Churn_test$Churn)
print(confusion_matrix)

## 3. Linear Discriminant Analysis ----
### 3.a. Linear Discriminant Analysis without caret
library(readr)
Crop_recommendation <- read_csv("data/Crop_recommendation.csv")
Crop_recommendation$label <- ifelse(Crop_recommendation$label == "rice", 0, 1)
View(Crop_recommendation)

train_index <- createDataPartition(Crop_recommendation$label, p = 0.7, list = FALSE)
Crop_recommendation_train <- Crop_recommendation[train_index, ]
Crop_recommendation_test <- Crop_recommendation[-train_index, ]

Crop_recommendation_train$label <- factor(Crop_recommendation_train$label)
Crop_recommendation_test$label <- factor(Crop_recommendation_test$label)

library(MASS)
label_model_lda <- lda(label ~ ., data = Crop_recommendation_train)

print(label_model_lda)

predictions <- predict(label_model_lda, Crop_recommendation_test[, 1:7])

table(predictions$class, Crop_recommendation_test$label)


### 3.b. Linear Discriminant Analysis with caret ----
library(readr)
Crop_recommendation <- read_csv("data/Crop_recommendation.csv")
Crop_recommendation$label <- ifelse(Crop_recommendation$label == "rice", 0, 1)
View(Crop_recommendation)

train_index <- createDataPartition(Crop_recommendation$label,
                                   p = 0.7,
                                   list = FALSE)

crop_recommendation_train$label <- as.factor(crop_recommendation_train$label)
crop_recommendation_test$label <- as.factor(crop_recommendation_test$label)


set.seed(7)

train_control <- trainControl(method = "LOOCV")

crop_recommendation_caret_model_lda <- train(label ~ .,
                                             data = crop_recommendation_train,
                                             method = "lda2",  # Use "lda2" for classification
                                             metric = "Accuracy",
                                             preProcess = c("center", "scale"),
                                             trControl = train_control)

print(crop_recommendation_caret_model_lda)

predictions <- predict(crop_recommendation_caret_model_lda,
                       crop_recommendation_test[, 1:8])

confusion_matrix <- caret::confusionMatrix(predictions,
                                           crop_recommendation_test$label)


print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


## 4. Regularized Linear Regression ----
Student_Marks <- read.csv("data/Student_Marks.csv")

student_no_na <- na.omit(Student_Marks)


set.seed(7)
train_index <- createDataPartition(student_no_na$Marks, p = 0.7, list = FALSE)
student_train <- student_no_na[train_index, ]
student_test <- student_no_na[-train_index, ]


train_control <- trainControl(method = "cv", number = 5)
student_caret_model_glmnet <- train(Marks ~ ., data = student_train, method = "glmnet",
                                    metric = "RMSE", preProcess = c("center", "scale"), trControl = train_control)

print(student_caret_model_glmnet)

predictions <- predict(student_caret_model_glmnet, student_test[, 1:3])

rmse <- sqrt(mean((student_test$Marks - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

ssr <- sum((student_test$Marks - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))

sst <- sum((student_test$Marks - mean(student_test$Marks))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))

r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))

absolute_errors <- abs(predictions - student_test$Marks)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))

# B. Non-Linear Algorithms ----
## 1.  Classification and Regression Trees ----
### 1.b. Decision tree for a regression problem without CARET ----
#### Load and split the dataset ----
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")
View(Customer_Churn)

set.seed(7)
sample_indices <- sample(seq_len(nrow(Customer_Churn)), size = 0.7 * nrow(Customer_Churn))
Customer_Churn_train <- Customer_Churn[sample_indices, ]
Customer_Churn_test <- Customer_Churn[-sample_indices, ]

Churn_model_cart <- rpart(Churn ~ ., data = Customer_Churn_train,
                            control = rpart.control(minsplit=5))

print(Churn_model_cart)

predictions <- predict(Churn_model_cart, Customer_Churn_test[, 1:14])

rmse <- sqrt(mean((Customer_Churn_test$Churn - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))

ssr <- sum((Customer_Churn_test$Churn - predictions)^2)
cat("SSR =", sprintf("%.4f", ssr), "\n")

sst <- sum((Customer_Churn_test$Churn - mean(Customer_Churn_test$Churn))^2)
cat("SST =", sprintf("%.4f", sst), "\n")

r_squared <- 1 - (ssr / sst)
cat("R Squared =", sprintf("%.4f", r_squared), "\n")

absolute_errors <- abs(predictions - Customer_Churn_test$Churn)
mae <- mean(absolute_errors)
cat("MAE =", sprintf("%.4f", mae), "\n")


## 2.  Naive Bayes----
### 2.b. Naïve Bayes Classifier for a Classification Problem with CARET ----
data(Ionosphere)
View(Ionosphere)

train_index <- createDataPartition(Ionosphere$Class, p = 0.7, list = FALSE)
ionosphere_train <- Ionosphere[train_index, ]
ionosphere_test <- Ionosphere[-train_index, ]

ionosphere_model_nb <- naiveBayes(Class ~ ., data = ionosphere_train)

print(ionosphere_model_nb)

predictions <- predict(ionosphere_model_nb, 
                       ionosphere_test[, 1:34])

confusion_matrix <- confusionMatrix(predictions, ionosphere_test$Class)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


## 3.  k Nearest Neighbours----
## kNN for a classification problem with CARET's train function ----
# Load and split the dataset
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")

# Split the dataset
set.seed(7)
sample_indices <- sample(seq_len(nrow(Customer_Churn)), size = 0.7 * nrow(Customer_Churn))
Churn_train <- Customer_Churn[sample_indices, ]
Churn_test <- Customer_Churn[-sample_indices, ]

# Define the train control settings for 10-fold cross-validation
train_control <- trainControl(method = "cv", number = 10)

# Train the k-NN model with data standardization
Churn_caret_model_knn <- train(Churn ~ ., data = Churn_train,
                               method = "knn", metric = "Accuracy",
                               preProcess = c("center", "scale"),
                               trControl = train_control)

print(Churn_caret_model_knn)

#### Make predictions ----
predictions <- predict(Churn_caret_model_knn, Churn_test)

# Display the model's evaluation metrics
confusion_matrix <- caret::confusionMatrix(predictions, Churn_test$Churn)
print(confusion_matrix)

# Create a confusion matrix plot
fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 4.  Support Vector Machines----
### 4.a. SVM Classifier for a classification problem without CARET ----
# Load and split the dataset
library(readr)
Customer_Churn <- read_csv("data/Customer Churn.csv")

# Split the dataset
set.seed(7)
sample_indices <- sample(seq_len(nrow(Customer_Churn)), size = 0.7 * nrow(Customer_Churn))
Churn_train <- Customer_Churn[sample_indices, ]
Churn_test <- Customer_Churn[-sample_indices, ]

# Train the model
Churn_model_svm <- ksvm(Churn ~ ., data = Churn_train, kernel = "rbfdot")

# Display the model's details
print(Churn_model_svm)

# Make predictions for the Churn dataset
Churn_predictions <- predict(Churn_model_svm, Churn_test[, 1:13], type = "response")

# Convert the Churn_predictions to binary values (0 or 1) based on a threshold
Churn_predictions <- ifelse(Churn_predictions > 0.5, 1, 0)

# Display the model's evaluation metrics
confusion_matrix <- table(Churn_predictions, Churn_test$Churn)
print(confusion_matrix)

# Plot the confusion matrix
fourfoldplot(confusion_matrix, color = c("grey", "lightblue"), main = "Confusion Matrix")
