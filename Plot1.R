powertext <- "./household_power_consumption.txt"

hpc<-read.csv2(powertext)

hpc$Date<-as.Date(hpc$Date)

hpc<-read.csv2(powertext,stringsAsFactors=FALSE,nrows=70000,na.strings="?")

hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

for(i in 3:9)
 hpc[,i]<-as.numeric(hpc[,i])

hpc2<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")

par(mfrow=c(1,1))

png(file="Plot1.png")

hist(hpc2[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
