


## Set working directory
  setwd("C:/Users/jonat/coursera/DS/R_wd")

## read in the full dataset
  alldata <- read.csv("household_power_consumption.txt",sep= ";", header = TRUE, stringsAsFactors = FALSE)
## subset for first two days Feb 2007
  dat<-subset(alldata,alldata$Date %in% c("1/2/2007","2/2/2007"))
## format to data,time numeeric
  dat$Date                 <- as.Date(dat$Date,format="%d/%m/%Y")
  dat$Time                 <- strptime(dat$Time, format = "%H:%M:%S")
  year(dat$Time)           <- year(dat$Date)
  month(dat$Time)          <- month(dat$Date)
  day(dat$Time)            <- day(dat$Date)
  dat$Global_active_power  <-as.numeric(dat$Global_active_power)
  dat$Global_reactive_power<-as.numeric(dat$Global_reactive_power)
  dat$Voltage              <-as.numeric(dat$Voltage)
  dat$Global_intensity     <-as.numeric(dat$Global_intensity)
  dat$Sub_metering_1       <-as.numeric(dat$Sub_metering_1)
  dat$Sub_metering_2       <-as.numeric(dat$Sub_metering_2)
  dat$Sub_metering_3       <-as.numeric(dat$Sub_metering_3)

  ##  Plot 4
  png(filename = "plot4.png")
  par(mfcol= c(2,2))
  
  plot(dat$Time,dat$Global_active_power, type = "l",col="black",xlab= "", ylab= "Global Active Power (kilowatts)",main = "")
  
  plot(dat$Time,dat$Sub_metering_1, type = "n",col="black",  xlab= "", ylab= "Energy sub metering",main = "")
  points(dat$Time,dat$Sub_metering_1, type = "l",col="black",  xlab= "", ylab= "",main = "")
  points(dat$Time,dat$Sub_metering_2, type = "l",col="red",  xlab= "", ylab= "",main = "")
  points(dat$Time,dat$Sub_metering_3, type = "l",col="blue",  xlab= "", ylab= "",main = "")
  legend("topright",lwd = 2,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(dat$Time,dat$Voltage, type = "l",col="black",xlab= "datetime", ylab= "Voltage",main = "")
  
  plot(dat$Time,dat$Global_reactive_power, type = "l",col="black",xlab= "datetime", ylab= "Global_reactive_power",main = "")
  dev.off()  
  
  
  