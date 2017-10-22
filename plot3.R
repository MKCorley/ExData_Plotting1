#Plot 3
#Plot for Energy sub metering over 2 days

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

#create the plot as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot3.png") #open png file device
plot(data$NewCol, data$Sub_metering_1, 
     xlab = "", ylab = "Enegry sub metering", 
     type="n") 
  points(data$NewCol, data$Sub_metering_1, type = "line", col="black")
  points(data$NewCol, data$Sub_metering_2, type = "line", col="red")
  points(data$NewCol, data$Sub_metering_3, type = "line", col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1)) #create legend
dev.off() #turn off png file device
