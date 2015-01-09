## Getting full dataset - 
power_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
power_sub <- subset(power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Free Some Memory!!
rm(power_data)

## Converting dates
datetime <- paste(as.Date(power_sub$Date), power_sub$Time)
power_sub$Datetime <- as.POSIXct(datetime)

## Plot the data to screen - set parameters as per spec
par(mfrow=c(1,1))
plot(power_sub$Global_active_power~power_sub$Datetime, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

## Save the plot to file
dev.copy(png, 
         file="./ExData_Plotting1/plot2.png", 
         height=480, 
         width=480)
dev.off()