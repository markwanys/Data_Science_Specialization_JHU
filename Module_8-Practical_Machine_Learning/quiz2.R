q1 <- function(){
  library(AppliedPredictiveModeling)
  data(AlzheimerDisease)
  
  adData = data.frame(diagnosis,predictors)
  trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
  training = adData[trainIndex,]
  testing = adData[-trainIndex,]
  training
  testing
}

q2 <- function(){
  library(AppliedPredictiveModeling)
  data(concrete)
  library(caret)
  set.seed(1000)
  inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
  training = mixtures[ inTrain,]
  testing = mixtures[-inTrain,]
  
  library(Hmisc)
  
  par(mfrow=c(2,4))
  for (name in colnames(concrete)[which(colnames(concrete)!="CompressiveStrength")]){
    cuts <- cut2(concrete[,name])
    plot(as.integer(rownames(concrete)),mixtures$CompressiveStrength,col=cuts,main=name)
    legend("right",legend=unique(cuts),col=unique(cuts), title=name,pch =15)
  # par(mfrow=c(1,1))
  # cuts <- cut2(concrete[,"Age"])
  # plot(as.integer(rownames(concrete)),mixtures$CompressiveStrength,col=cuts,main="Age")
  # legend("right",legend=unique(cuts),col=unique(cuts), title="Age",pch =15)
  }
}

q3 <- function() {
  library(AppliedPredictiveModeling)
  data(concrete)
  library(caret)
  set.seed(1000)
  inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
  training = mixtures[ inTrain,]
  testing = mixtures[-inTrain,]
  par(mfrow=c(1,2))
  hist(mixtures$Superplasticizer)
  hist(log10(mixtures$Superplasticizer))
}

q4 <- function() {
  library(caret)
  library(AppliedPredictiveModeling)
  set.seed(3433)
  data(AlzheimerDisease)
  adData = data.frame(diagnosis,predictors)
  inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
  training = adData[ inTrain,]
  testing = adData[-inTrain,]
  
  il_idx <- grepl("^IL.*$",names(training))
  training2 <- training[,il_idx]
  preProc <- preProcess(training2,method="pca",thresh=0.9)
  preProc
}

q5 <- function(){
  #library(caret)
  #library(AppliedPredictiveModeling)
  #install.packages('e1071', dependencies=TRUE)
  set.seed(3433)
  data(AlzheimerDisease)
  adData = data.frame(diagnosis,predictors)
  inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
  training = adData[ inTrain,]
  testing = adData[-inTrain,]
  
  training2 <- training[,grepl("^IL|diagnosis",names(training))]
  testing2 <- testing[,grepl("^IL|diagnosis",names(testing))]

  modelFit <- train(diagnosis~.,method='glm',data=training2)
  print(confusionMatrix(testing$diagnosis,predict(modelFit,testing2))$overall[1])
  
  modelFit_PCA <- train(diagnosis~.,method='glm',preProcess='pca',data=training2,trControl=trainControl(preProcOptions = list(thresh=0.8)))
  print(confusionMatrix(testing$diagnosis,predict(modelFit_PCA,testing2))$overall[1])
  
}

q6 <- function() {
  library(caret)
  library(AppliedPredictiveModeling)
  set.seed(3433)
  data(AlzheimerDisease)
  adData = data.frame(diagnosis,predictors)
  inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
  training = adData[ inTrain,]
  testing = adData[-inTrain,]
  
  # grep all columns with IL and diagnosis in the traning and testing set
  trainingIL <- training[,grep("^IL|diagnosis", names(training))]
  testingIL <- testing[,grep("^IL|diagnosis", names(testing))]
  
  # non-PCA
  model <- train(diagnosis ~ ., data = trainingIL, method = "glm")
  predict_model <- predict(model, newdata= testingIL)
  matrix_model <- confusionMatrix(predict_model, testingIL$diagnosis)
  matrix_model$overall[1]
}

