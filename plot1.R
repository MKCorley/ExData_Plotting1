#Plot 1
#Histogram for Global Active Power

#For Course 4 Week 1 Programming Assignment
#Data from the UC Irvine Machine Learning Repository
#Descriptions of the variables in the dataset can be found here:
  #https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

#Read the data into R
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na="?") 
  head(alldata) #Global_active_power = 3rd column

#convert "Date" variable to the class Date
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y") 

#Subset dates 2007-02-01 and 2007-02-02
data <- subset(alldata, Date > "2007-01-31" & Date < "2007-02-03")
  #check to see that correct dates were subsetted
  str(data) 
  tail(data)

#create the plot as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot1.png") #open png file device
  hist(data$Global_active_power, 
       col = "red", 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power") #create plot
  dev.off() #turn off png file device
