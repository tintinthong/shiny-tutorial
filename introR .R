
x=1
y<-2


x+y
print(x+y)

x %% 2
x!=2 


vec1<-c(1,2,3)
vec2<-c(6,7,8)

for(i in 1:10){
  print(i)
}

if(x>2){
  print("x is greater than 2")
}else if(x ==2){
  print( "x equals")
}else{
  print("wubba lubba  dub dub")
}

timesTwo<-function(x){
  return(x*2)
}

data=data.frame(x=c(1,2,3),y=c(5,4,2))
data[1,]
colnames(data)
dim(data)

apply(data,2,timesTwo)

obj=list(var1=c("justin ","thong"),var2= c("ian","lim"))
paste(c("justin","thong"),"2")

mod<-lm(y~x,data)
plot(1, type="n", xlab="", ylab="", xlim=c(0, 10), ylim=c(0, 10))
abline(mod)







       
