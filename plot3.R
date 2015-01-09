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
with(power_sub, {
    plot(Sub_metering_1~Datetime, 
         type="l",
         ylab="Energy sub metering", 
         xlab="")
    lines(Sub_metering_2~Datetime,
          col='Red')
    lines(Sub_metering_3~Datetime,
          col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Save the plot to file
dev.copy(png, 
         file="./ExData_Plotting1/plot3.png", 
         height=480, 
         width=480)
dev.off()