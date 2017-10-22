#Plot 4
#Plots for 1) Global Active Power, 2) Voltage, 3) Engergy Sub-metering, and 4) Global reactive power

#For Course 4 Week 1 Programming Assignment
#Data from the UC Irvine Machine Learning Repository
#Descriptions of the variables in the dataset can be found here:
  #https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

#Read the data into R
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na="?") 
head(alldata) #Check table

#Convert "Date" variable to the class Date
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y") 

#Subset dates 2007-02-01 and 2007-02-02
data <- subset(alldata, Date > "2007-01-31" & Date < "2007-02-03")
#check to see that correct dates were subsetted
str(data) 
tail(data)

#Convert factor "Time" and create new column for date and time together
data$NewCol <- do.call(paste, c(data[c("Date", "Time")], sep = " ")) #concatenate Date and Time into NewCol
data$NewCol <- strptime(data$NewCol, "%Y-%m-%d %H:%M:%S")


#create the plots as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot4.png") #open png file device

#set for four plot panels
par(mfrow = c(2, 2))

#1st plot (upper left)
plot(data$NewCol, data$Global_active_power, 
     type="line", 
     xlab = "", ylab = "Global Active Power")

#2nd plot (upper right)
plot(data$NewCol, data$Voltage,
     type = "line",
     xlab = "datetime", ylab = "Voltage")

#3rd plot (lower left)
plot(data$NewCol, data$Sub_metering_1, 
     xlab = "", ylab = "Enegry sub metering", 
     type="n") 
points(data$NewCol, data$Sub_metering_1, type = "line", col="black")
points(data$NewCol, data$Sub_metering_2, type = "line", col="red")
points(data$NewCol, data$Sub_metering_3, type = "line", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
       lty = c(1, 1, 1), cex = 0.75) #create legend

#4th plot (lower right)
plot(data$NewCol, data$Global_reactive_power,
     type = "line",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off() #turn off png file device
