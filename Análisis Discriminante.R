#Anális discriminante

library(MASS)

rld <- lda(dona_Marzo2007~n+ultima_don+primera_don,data = Training)
plda <- predict(object = rld, newdata = Training_Data)
res <- plda$posterior[,2]

library("ROCR")

#Prediction

pred <- prediction(res,Training_Data$dona_Marzo2007)


#Performance
perf <- performance(pred, "tpr","fpr")


#Gráficos ROC
plot(perf1)
plot(perf,add=TRUE,col='red')