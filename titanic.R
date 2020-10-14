titanic.raw
library(datasets)  
library(caTools) 
library(party) 
library(dplyr) 
library(magrittr)

head(titanic.raw)
sample_data = sample.split(titanic.raw, SplitRatio = 0.70)
train_data <- subset(titanic.raw, sample_data == TRUE) 
test_data <- subset(titanic.raw, sample_data == FALSE) 

dtree <- ctree(Survived ~ ., train_data) 
plot(dtree)
sample_data
predict_model<-predict(dtree, test_data)  

confusionMatrix <- table(test_data$Survived, predict_model)  
confusionMatrix

library(e1071) 
library(caTools) 
library(caret) 

#Naive Bayes Below
model <- naiveBayes(Survived ~ ., data = train_data) 
pred <- predict(model, test_data)
table(pred, test_data$Survived)
