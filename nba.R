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
data_TOR %>% group_by(Opponent,WINorLOSS)%>% summarise(winCount=n())

#Assists
data_TOR  %>% group_by(Opponent)%>%  summarise(meanAssists= mean(Assists),meanOpponentAssits=mean(Opp.Assists))

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
