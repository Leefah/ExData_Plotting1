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

png(file="plot1.png", width=480, height=480)		## Open PNG device 

hist(df$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

dev.off()		## Close the device


