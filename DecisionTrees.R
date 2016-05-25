#Random Forest
library(randomForest)
rfor <- randomForest(as.factor(dona_Marzo2007)~n+ultima_don+primera_don,data = Training,importance=TRUE)
importance(rfor)
prrfor <- predict(rfor,Training_Data,type='prob')
resrf <- prrfor[,2]
for (i in 1:length(resrf)){if(resrf[i]==0){resrf[i]<-0.000001}}
logloss(resrf)

#Conditional Tree
library(partykit)
ctree <- ctree(as.factor(dona_Marzo2007)~n+ultima_don+primera_don,data = Training)
plot(ct1)
prctree <- predict(ctree, Training_Data,type='prob')
resct <- prctree[,2]
logloss(resct)

#GBM
Gbm <-  gbm.fit(Training[,c(2,3)],Training$dona_Marzo2007,n.trees = 1000)
resgbm<- predict(Gbm,Training_Data,type='response',n.trees = 1000)
logloss(resgbm)