# R File Contains Naive Bayes, KNN, Random Forest

# Basic Evaluation Steps

library(e1071)
library(mlr)
library(readtext)

# This function contains the Naive Bayes Classifier with conditional Probabilities
naive_bayes <- function(datafr,lambda=0){
  num_features <- ncol(datafr) - 1
  num_obs <- nrow(datafr)
  num_class <- length(unique(datafr[,num_features+1]))
  # Calculating conditional probabilities  
  for (i in 1:num_features) {
    tab <- table(datafr[,i],datafr[,num_features+1]) + lambda
    if (i==1){
      all <- apply(tab,2,sum)
      conprob <- sweep(tab,2,all,'/')      
    }
    else
    {
      update <- sweep(tab,2,all,'/')
      conprob <- rbind(conprob,update)
    }
  }
  all <- all/sum(all)
  conprob <- rbind(conprob,all)
  # Calculating predictions
  for (i in 1:num_obs) {
    obs <- conprob[c(as.character(datafr[i,1:num_features]),"all"),]
    obsprob <- apply(obs,2,prod)
    if (i==1) {
      preds <- names(which.max(obsprob))
    }
    else{
      preds <- c(preds,names(which.max(obsprob)))
    }
  }
  error <- 100*(1-sum(preds==datafr[,num_features+1])/length(datafr[,1]))
  model <- list(conprob,datafr[,num_features+1],preds,error)
  return(model)
}

# The Dataset is the bag of words for which the Directory should be changed
dataset <- read.csv("C:/Users/siva/Desktop/Data Mining Assignment/Final Assignment/data/20_newsgroup/bag_of_words.csv",as.is = TRUE)

# Creating Training and Testing Sets
n= nrow(dataset)
i.train=sample((1:n),0.7*n)
data.train=dataset[i.train,]
data.test=dataset[-i.train,]

# Checking for the Distribution of the Classes with Training and Testing set
barplot(table(data.train$folder_class), main="Class Distribution of Training Data Set", ylab= "Frequency",
        xlab= "Folder Class", beside=TRUE, col=rainbow(4), family = "Helvetica")

legend("bottomright", c("comp.sys.ibm.pc.hardware","sci.electronics","talk.politics.guns","talk.politics.misc"), cex=0.6, fill=rainbow(4));



barplot(table(data.test$folder_class), main="Class Distribution of Testing Data Set", ylab= "Frequency",
        xlab= "Folder Class", beside=TRUE, col=rainbow(4), family = "Helvetica")

legend("bottomright", c("comp.sys.ibm.pc.hardware","sci.electronics","talk.politics.guns","talk.politics.misc"), cex=0.6, 
       fill=rainbow(4));


# Naive Bayes Classification using the Function above
pred_dataset <- naive_bayes(data.train)
pred_dataset
table(pred_dataset[[2]],pred_dataset[[3]])
confusionMatrix(table(pred_dataset[[2]],pred_dataset[[3]]))


# KNN Classifier using count and MLR package
target = colnames(data.train)[ length(colnames(data.train))]
task = makeClassifTask(data = data.train, target = target)
learner_knn = makeLearner("classif.knn", k=3)
train.set = c(1:nrow(data.train))
model_knn = mlr::train(learner_knn, task, subset = train.set)
unseen_predictions_knn = predict(model_knn, newdata = data.test, type="folder_class")
accuracy_knn = performance(unseen_predictions_knn, measures = acc)
cat("Accuracy KNN: ", accuracy_knn)

# Randomforest Classifier using count and MLR package
learner_randomforest = makeLearner("classif.randomForest")
model_randomforest = mlr::train(learner_randomforest, task, subset = train.set)
unseen_predictions_randomforest = predict(model_randomforest, newdata = data.test)
accuracy_randomforest = performance(unseen_predictions_randomforest, measures = acc)
cat("Accuracy Random Forest: ", accuracy_randomforest)
