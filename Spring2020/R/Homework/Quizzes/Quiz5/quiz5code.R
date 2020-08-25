)

#Load testdata in
df<-as.data.frame(df)
names(df)<-c('days','outlook','temperature','humidity','windy','playtennis')
#Create key to do predictions
df$prediction<-NA
df$prediction[df$outlook=='Overcast']<-'Yes'
df$prediction[df[,2]=='Sunny' &df[,4]=='high']<-'No'
df$prediction[df[,2]=='Sunny' &df[,4]=='low']<-'Yes'

df$prediction[df[,2]=='Rain' &df[,5]=='strong']<-'No'
df$prediction[df[,2]=='Rain' &df[,5]=='weak']<-'Yes'


confusionMatrix(as.factor(df[,7]),as.factor(df[,6]))

