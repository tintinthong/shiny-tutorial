library(tidyverse)

data=read.csv("nba.games.stats.csv")

data=as_tibble(data)

dim(data)


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

datanew %>%select(math.score,interval )%>%group_by(interval) %>% tally()



x<-1:100
t<-table(cut(sample(x,1000,replace=TRUE),seq(0,100,10)))

str(t) 
attr(t,"dimnames")[[1]]= paste(toupper(rev(letters[1:10])),attr(t,"dimnames")[[1]])

toupper(letters[1:10])
str(t)
