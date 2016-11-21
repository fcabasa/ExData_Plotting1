## For each plot you should

## Construct the plot and save it to a PNG file with a width of 480 pixels 
## and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs 
## the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
## Your code file should include code for reading the data so that the plot 
## can be fully reproduced. You should also include the code that creates the PNG file.

## Add the PNG file and R code file to your git repository

## When you are finished with the assignment, push your git repository to 
## GitHub so that the GitHub version of your repository is up to date. 
## There should be four PNG files and four R code files.

## 1) Create data frame object from text file
epc <- read.table("household_power_consumption.txt",header=T,sep=";")

## 2) Prepare fields in data frame 
epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))
epc$Global_reactive_power <- as.numeric(as.character(epc$Global_reactive_power))
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc$Sub_metering_1 <- as.numeric(as.character(epc$Sub_metering_1))
epc$Sub_metering_2 <- as.numeric(as.character(epc$Sub_metering_2))
epc$Sub_metering_3 <- as.numeric(as.character(epc$Sub_metering_3))
epc$Voltage <- as.numeric(as.character(epc$Voltage))

## 3) Subset data for dates between 2/1/2007 and 2/2/2007
epc_plot4 <- subset(epc, epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02")

## 4) Create combined date and time 
epc_plot4$DateTime <- as.POSIXct(paste(epc_plot4$Date, epc_plot4$Time), format="%Y-%m-%d %H:%M:%S") 

## 5) Create plotting spacing 
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## 5) Create final plot and output file

with(epc_plot4, {
  plot(epc_plot4$DateTime, epc_plot4$Global_active_power, 
       xlab="", ylab="Global Active Power", type="n") 
  lines(epc_plot4$DateTime, epc_plot4$Global_active_power)
  plot(epc_plot4$DateTime, epc_plot4$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
  lines(epc_plot4$DateTime, epc_plot4$Voltage)
  plot(epc_plot4$DateTime, epc_plot4$Sub_metering_1, 
       xlab="", ylab="Energy Sub Metering", type="n") 
  lines(epc_plot4$DateTime, epc_plot4$Sub_metering_1, col="black")
  lines(epc_plot4$DateTime, epc_plot4$Sub_metering_2, col="red")
  lines(epc_plot4$DateTime, epc_plot4$Sub_metering_3, col="blue")
  legend("topright", lty=1, box.lwd = 0, cex=.9, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(epc_plot4$DateTime, epc_plot4$Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power", type="n")
  lines(epc_plot4$DateTime, epc_plot4$Global_reactive_power)
})

dev.off()

