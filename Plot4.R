powertext <- "./household_power_consumption.txt"

hpc<-read.csv2(powertext)

hpc$Date<-as.Date(hpc$Date)

hpc<-read.csv2(powertext,stringsAsFactors=FALSE,nrows=70000,na.strings="?")

hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

for(i in 3:9)
        hpc[,i]<-as.numeric(hpc[,i])

hpc2<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")

datetime<-paste(hpc2$Date,hpc2$Time)

datetime<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

png(file="Plot4.png")

par(mfrow=c(2,2))

plot(datetime,hpc2[,3],type='l',xlab="",ylab="Global Active Power (kilowatts)")

plot(datetime,hpc2$Voltage,type="l",ylab="Voltage")

plot(datetime,hpc2[,7],type="l",xlab="",ylab="Energy sub metering")

lines(datetime,hpc2[,8],col="red")

lines(datetime,hpc2[,9],col="blue")

legend("topright",legend=names(hpc2[,7:9]),lty=1,col=c("black","red","blue"))

plot(datetime,hpc2[,4],type="l",ylab=names(hpc2)[4])

dev.off()
