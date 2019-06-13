
#Just FORGET ABOUT THIS 

library(tidyverse)

data=read.csv("nba.games.stats.csv")

data=as_tibble(data)

dim(data)

glimpse(data)
levels(data$Team)

#filter only to toronto 

data_TOR= data%>% filter(data$Team=="TOR")

glimpse(data_TOR)

#filter  only certain statistics

data_TOR= data_TOR  %>% select(Date ,WINorLOSS,Opponent, TeamPoints, OpponentPoints,Assists, Opp.Assists,TotalRebounds, Opp.TotalRebounds ,Steals, Opp.Steals, Blocks, Opp.Blocks, Turnovers, Opp.Turnovers, FieldGoals., FreeThrows, Opp.FreeThrows , X3PointShots., Opp.3PointShots., TotalFouls, Opp.TotalFouls )%>%mutate(Date=as.Date(Date))
#TeamPoints

data_TOR %>% group_by(Opponent)%>% summarise(meanTeamPoints= mean(TeamPoints), meanOpponentPoints= mean(OpponentPoints))

#WINorLOSS against each team
data_TOR %>% filter(Opponent=="ATL")%>%group_by(WINorLOSS)%>%ggplot(aes(WINorLOSS))+geom_bar(aes(fill=WINorLOSS))

#Assists
data_TOR  %>% filter(Opponent=="ATL")%>%group_by(Opponent)%>%summarise(meanAssists= mean(Assists))%>%summarise(meanOpponentAssits=mean(Opp.Assists))%>% melt(id.vars='Opponent')%>%ggplot(aes(x=variable,y=value))+geom_bar(aes(fill=variable),stat="identity")
colnames(data_TOR)


data_TOR%>% filter(Opponent=="ATL")%>% group_by(Opponent)%>%summarise(meanAssists= mean(Assists),meanOpponentAssists=mean(Opp.Assists))%>%melt(id.vars='Opponent')%>%ggplot(aes(x=variable,y=value))+geom_bar(aes(fill=variable),stat="identity")
#Rebounds 

data_TOR  %>% group_by(Opponent)%>%  summarise(meanTotalRebounds= mean(TotalRebounds),meanOpponentTotalRebounds=mean(Opp.TotalRebounds))s
#Date 


#plot for  the  plot belo

ggplot(data_TOR, aes(x=Date, y=TeamPoints, group=Opponent)) +
  geom_line(aes(color=Opponent))+
  scale_x_date(labels = function(x) format(x, "%d-%b"))


# ---------  TEST TEST TEST 
data=read.csv("./StudentsPerformance.csv")
varE=10
varD=30
varC=50
varB=70
varA=80
breaks=c(0,varE,varD,varC,varB,varA,100)
datanew=data%>%mutate(
  interval= cut(math.score,breaks ,include.lowest=TRUE)
)

datanew %>%select(math.score,interval)%>%group_by(interval) %>% tally()



x<-1:100
t<-table(cut(sample(x,1000,replace=TRUE),seq(0,100,10)))

str(t) 
attr(t,"dimnames")[[1]]= paste(toupper(rev(letters[1:10])),attr(t,"dimnames")[[1]])

toupper(letters[1:10])
str(t)


x <- c(5,17,31,9,17,10,30,28,16,29,14,34)
y <- c(1,2,3,4,5,6,7,8,9,10,11,12)
day <- c(1,2,3,4,5,6,7,8,9,10,11,12)

library(reshape2)
df1 <- data.frame(x, y, day)
df1
df2 <- melt(df1, id.vars='day')
df2
head(df2)


bleach_time <- c(0, 0, 0, 0, 0, 0, 24, 24, 24, 24, 24, 24)
conc <- c(23, 54, 12, 96, 34, 65, 34, 22, 35, 06, 90, 69)
df <- data_frame(bleach_time, conc)

df%>%group_by(bleach_time )%>%summarise(mean=mean(conc))

df_p <- ggplot(df, aes(as.factor(bleach_time), conc))+geom_bar(stat = "identity", na.rm = TRUE)
df_p

stat_summary(fun.y = mean, geom = "bar", na.rm = TRUE)
