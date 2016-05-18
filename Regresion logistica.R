#Regresión Logística

#Creamos tres modelos diferentes basados en la base de datos "Training"
reglog1 <- glm(dona_Marzo2007~n+ultima_don+primera_don,data = Training,family = binomial)
reglog2 <- glm(dona_Marzo2007~n+primera_don,data = Training,family = binomial)
reglog3 <- glm(dona_Marzo2007~n+ultima_don,data = Training,family = binomial)
reglog4 <- glm(dona_Marzo2007~ultima_don+primera_don,data = Training,family = binomial)

#Curvas ROC
library("ROCR")

#Predictions
res1 <- predict(reglog1,Training_Data,type = 'response')
res2 <- predict(reglog2,Training_Data,type = 'response')
res3 <- predict(reglog3,Training_Data,type = 'response')
res4 <- predict(reglog4,Training_Data,type = 'response')

pred1 <- prediction(res1,Training_Data$dona_Marzo2007)
pred2 <- prediction(res2,Training_Data$dona_Marzo2007)
pred3 <- prediction(res3,Training_Data$dona_Marzo2007)
pred4 <- prediction(res4,Training_Data$dona_Marzo2007)

#Performance
perf1 <- performance(pred1, "tpr","fpr")
perf2 <- performance(pred2, "tpr","fpr")
perf3 <- performance(pred3, "tpr","fpr")
perf4 <- performance(pred4, "tpr","fpr")

#Gráficos ROC
plot(perf1)
plot(perf2,add=TRUE,col='red')
plot(perf3,add=TRUE,col='blue')
plot(perf4,add=TRUE,col='green')

