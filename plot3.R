setwd("C:/Users/leefah/Documents/Coursera/EDA/Project 1")

## Look at the data frame

ini<-read.table("household_power_consumption.txt", sep=";", header=T,stringsAsFactors=F,nrow=10)

name<-colnames(ini)          ## getting column names.

## Read in smaller set of data, discarding many extra rows after calculations.

subdat<-read.table("household_power_consumption.txt", sep=";", stringsAsFactors=F,skip=66600, nrows=3000)

names(subdat)<- name        	## naming columns

df<-subdat[subdat$Date=="1/2/2007" | subdat$Date=="2/2/2007",]		## subsetting required data

df$datetime<- paste(df$Date,df$Time)			## creating a new variable with date and time

df$datetime<-strptime(df$datetime, "%d/%m/%Y %H:%M:%S")    # converting to Date/Time class

df$Date<- as.Date(df$Date, "%d/%m/%Y")		## convert class of variable "Date" into Date class

png(file="plot3.png", width=480, height=480)		## Open PNG device 

with(df, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering"))
with(df, points(datetime, Sub_metering_2, type="l", col="red"))
with(df, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), cex=0.8, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()		## Close the device

