## Notes

<b>Legend Issues</b><br>
Did have some problems getting the Legend in Plot 3 and lower left graph of Plot 4
to fit within the boundaries of the box when using RStudio.

* Tried various parameter changes to fix this issue with no luck.

* Discussion forum entry supplied the fix - use R rather than RStudio: need to look
into whether the version of RStudiop is the issue.

<b>Possible Solution</b><br>

* Using the png function to create the image file seems to work from within RStudio.
```
png(filename="./ExData_Plotting1/plot3.png",
    pointsize=12,
    height=480,
    width=480)

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

dev.off()
```
