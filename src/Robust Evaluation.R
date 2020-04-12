#This R file contains Robust Evaluation
library(caret)
library(car)
library(randomForest)
library(MASS)
install.packages("xgboost")

set.seed(1)
# The Dataset is the bag of words for which the Directory should be changed
dataset <- read.csv("C:/Users/siva/Desktop/Data Mining Assignment/Final Assignment/data/20_newsgroup/bag_of_words.csv",as.is = TRUE)

# Creating Training and Testing Sets
n= nrow(dataset)
dim(data.train)
i.train=sample((1:n),0.7*n)
data.train=dataset[i.train,]
data.test=dataset[-i.train,]


#SVM MODEL
svm_model <- svm(data.train$folder_class~., data = data.train,  type = "C", kernel = "linear")
summary(svm_model)
predsvm <- predict(svm_model,data.test, type = "class")
predsvm
confusionMatrix(table(predsvm,data.test$folder_class))


#Random Forest Model with caret package
randomforest_model<- randomForest(data.train$folder_class~ ., data = data.train, importance = TRUE)
summary(randomforest_model)
predrandomforest <- predict(randomforest_model,data.test, type = "class")
confusionMatrix(table(round(predrandomforest), data.test$folder_class))



#KNN Model with Cross Validation
target = colnames(data.train)[ length(colnames(data.train))]
task = makeClassifTask(data = data.train, target = target)
learner_knn = makeLearner("classif.knn", k=3)
train.set = c(1:nrow(data.train))

#Cross Validation with Learner KNN
cv.knn <- crossval(learner = learner_knn,task = task,iters = 3,stratify = TRUE,measures = acc,show.info = F)
cv.knn$aggr
cv.knn$measures.test
model_knn = mlr::train(learner_knn, task, subset = train.set)
unseen_predictions_knn = predict(model_knn, newdata = data.test, type="folder_class")
accuracy_knn = performance(unseen_predictions_knn, measures = acc)
cat("Accuracy KNN: ", accuracy_knn)


#Hyper Parameter Tuning
getParamSet("classif.rpart")
makeatree <- makeLearner("classif.rpart", predict.type = "response")                
set_cv <- makeResampleDesc("CV",iters = 3L)                
gs <- makeParamSet(
  makeIntegerParam("minsplit",lower = 10, upper = 50),
  makeIntegerParam("minbucket", lower = 5, upper = 50),
  makeNumericParam("cp", lower = 0.001, upper = 0.2)
)
gscontrol <- makeTuneControlGrid()
stune <- tuneParams(learner = makeatree, resampling = set_cv, task = task, par.set = gs, control = gscontrol, measures = acc)

#using hyperparameters for modeling
t.tree <- setHyperPars(makeatree, par.vals = stune$x)



# Decisiontree Classifier using count and MLR package

target = colnames(data.train)[ length(colnames(data.train))]
task = makeClassifTask(data = data.train, target = target)
learner_decisiontree = makeLearner("classif.rpart")
train.set = c(1:nrow(data.train))
model_decisiontree = mlr::train(learner_decisiontree, task, subset = train.set)
unseen_predictions_decisiontree = predict(model_decisiontree, newdata = data.test, type="folder_class")
accuracy_decisiontree = performance(unseen_predictions_decisiontree, measures = acc)
cat("Accuracy Decision Tree: ", accuracy_decisiontree)

# Gradient Boost Classifier using count and MLR package

target = colnames(data.train)[ length(colnames(data.train))]
task = makeClassifTask(data = data.train, target = target)
learner_gbm = makeLearner("classif.gbm")
train.set = c(1:nrow(data.train))
model_gbm = mlr::train(learner_gbm, task, subset = train.set)
unseen_predictions_gbm = predict(model_gbm, newdata = data.test, type="folder_class")
accuracy_gbm = performance(unseen_predictions_gbm, measures = acc)
cat("Accuracy GBM: ", accuracy_gbm)

# XGBoost Classifier using count and MLR package

target = colnames(data.train)[ length(colnames(data.train))]
task = makeClassifTask(data = data.train, target = target)
learner_xgboost = makeLearner("classif.xgboost")
train.set = c(1:nrow(data.train))
model_xgboost = mlr::train(learner_xgboost, task, subset = train.set)
unseen_predictions_xgboost = predict(model_xgboost, newdata = data.test, type="folder_class")
accuracy_xgboost = performance(unseen_predictions_xgboost, measures = acc)
cat("Accuracy XGBOOST: ", accuracy_xgboost)
