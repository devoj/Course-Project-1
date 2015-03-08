#Course Project 1 for Explanatory data Analysis

#Get to the working directory with the data files that have already
#been downloaded with file.download and unzipped with unzip()
setwd("/Users/Davin/Documents/Coursera/Exploratory Data Analysis/Course-Project-1/")

#This text file is seperated by semicolons and the missing values are 
#are encoded with na.string = "?"
elec <- read.csv("household_power_consumption.txt", sep = ";", na.string = "?")

#The Date column is of class "factor" and must be changed to "date"
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
format(elec$Date, format = "POSIXlt")

#Now, subset the data.fram "elec" into the date ranges needed.
subelec <- subset(elec, elec$Date >= as.Date("2007-02-01") & 
                          elec$Date <= as.Date("2007-02-02"))
subelec$Date <- as.POSIXct(paste(subelec$Date, subelec$Time), 
                           format="%Y-%m-%d %H:%M:%S", tz = "GMT")




#plot 3

#open the png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#plot the data
plot(subelec$Sub_metering_1 ~ subelec$Date, ylab = "Energy sub metering",
     xlab = "", type = "n")
lines(subelec$Date, subelec$Sub_metering_1, col = "black")
lines(subelec$Date, subelec$Sub_metering_2, col = "red")
lines(subelec$Date, subelec$Sub_metering_3, col = "blue")
legend("topright", border = "", legend = c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), lty = 1,col = c("black", "red", "blue"))

#close the device
dev.off()

